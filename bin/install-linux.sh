#!/bin/bash
set -ex

pip3 install pre-commit

mkdir -p tmp
mkdir -p ~/.local/bin/
(
  cd tmp
  # terraform docs
  curl -Lso ./terraform-docs.tar.gz "$(curl -sL https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep -o -Ei "https://.+?-$(uname)-$(uname -m | sed 's/x86_/amd/').tar.gz")"
  tar -xzf terraform-docs.tar.gz
  chmod +x terraform-docs
  sudo mv terraform-docs /usr/bin/ || mv terraform-docs ~/.local/bin/

  # tflint
  curl -Lso ./tflint.zip "$(curl -sL https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -Ei "https://.+?_$(uname)_$(uname -m | sed 's/x86_/amd/').zip")"
  unzip tflint.zip
  sudo mv tflint /usr/bin/ || mv tflint ~/.local/bin/

  # tfsec
  curl -Lso ./tfsec "$(curl -sL https://api.github.com/repos/aquasecurity/tfsec/releases/latest | grep -o -Ei "https://.+?tfsec-$(uname)-$(uname -m | sed 's/x86_/amd/')" | uniq)"
  sudo mv tfsec /usr/bin/ || mv tfsec ~/.local/bin/
  sudo chmod +x /usr/bin/tfsec || chmod +x ~/.local/bin/tfsec

)
rm -rf tmp

# tfenv
mkdir -p ~/.tfenv
(
  cd ~/.tfenv
  curl -Lso ./tfenv.tar.gz "$(curl -sL https://api.github.com/repos/tfutils/tfenv/releases/latest | jq -r '.tarball_url')"
  tar -xzf tfenv.tar.gz
  rm tfenv.tar.gz
  # shellcheck disable=SC1090
  . ~/.profile || true
  ln -sf ~/.tfenv/bin/* ~/.local/bin
)

. bin/install-global.sh || . install-global.sh
