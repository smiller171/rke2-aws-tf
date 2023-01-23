#!/bin/bash
set -e

echo 'installing dependencies'
sudo apt install python3-pip gawk

. bin/install-linux.sh || . install-linux.sh
