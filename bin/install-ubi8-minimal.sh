#!/bin/bash

echo 'installing dependencies'
sudo microdnf install python39 gawk

. bin/install-linux.sh || . install-linux.sh

. bin/install-global.sh || . install-global.sh
