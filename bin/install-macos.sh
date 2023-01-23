#!/bin/bash

echo 'installing brew packages'
brew update
brew tap liamg/tfsec
brew install tfenv tflint terraform-docs pre-commit liamg/tfsec/tfsec coreutils
brew upgrade tfenv tflint terraform-docs pre-commit liamg/tfsec/tfsec coreutils

. bin/install-global.sh || . install-global.sh
