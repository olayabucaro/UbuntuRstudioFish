#!/usr/bin/env fish

# Require jq,  sudo apt-get install jq

echo "Beginning Quatro installation"

# Get metadata for the latest Electron for Ubuntu 22
echo "  - Retrieving Quarto metadata"

set URL (curl -s https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest | \
grep "browser_download_url.*linux-amd64.deb" | \
cut -d : -f 2,3 | \
tr -d \" | \
tr -d ' ')

set DEB (curl -s https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest | \
grep "browser_download_url.*linux-amd64.deb" | \
cut -d / -f 9,9 | \
tr -d \")

# Download the file
curl -L -O "$URL"

# Install latest Rstudio
echo "  - Installing latest Quatro relaese"

#sudo gdebi $DEB
sudo apt -y install (string join '' ./ $DEB)

# Remove instalation file
echo "  - Cleaning Up"
rm $DEB

echo "DONE"
