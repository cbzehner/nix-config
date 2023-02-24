set -uo errexit

if [ -z "$HOME" ]; then
    echo "[generate-ssh-keypair][skip] \$HOME is not set."
    exit 1
fi

label=$1                                                                  # Label identifying the service the generated keypair is associated with
if [ -z "$label" ]; then
    echo "[generate-ssh-keypair][skip] \$label is not set."
    exit 1
fi

email=$2                                                                  # Email address associated with the keypair
if [ -z "$email" ]; then
    echo "[generate-ssh-keypair][skip] \$email is not set."
    exit 1
fi

passphrase=${3:-}                                                         # Passphrase used to encrypt the keypair. Default: empty string / blank
if [ -z "$passphrase" ]; then
    echo "[generate-ssh-keypair][skip] \$passphrase is not set."
    exit 1
fi


private_key_path="$HOME/.ssh/id_ed25519.$label"
public_key_path="$private_key_path.pub"

# check for existing SSH key and avoid overwriting
if [[ -f "$private_key_path" || -f "$public_key_path" ]]; then
  echo "[generate-ssh-keypair][skip] existing keypair detected. If you want to generate a new keypair, first remove existing keys then rerun this script to proceed.
> rm $public_key_path $private_key_path"

  exit 1
fi

echo "[generate-ssh-keypair] generating SSH keypair..."

ssh-keygen -t ed25519 -C "$email" -P "$passphrase" -f "$private_key_path" # Generate a new SSH key
# chmod 600 "$private_key_path"{,.pub}                                      # Restrict access to the public and private keys to a single user
eval "$(ssh-agent -s)"                                                    # Enable the ssh-agent
ssh-add --apple-use-keychain "$private_key_path"                          # Add the generated private key to the ssh-agent

passphrase=""                                                             # Erase passphrase value to guard against accidental use
private_key_path=""                                                       # Erase private key path to guard against accidental use
# public_key_path=""                                                        # Erase public key path to guard against accidental use

echo "[generate-ssh-keypair] keypair generation complete."
