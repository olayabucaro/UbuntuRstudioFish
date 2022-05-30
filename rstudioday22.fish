#!/usr/bin/env fish

# Require jq,  sudo apt-get install jq

echo "Beginning RStudio installation"

# Get metadata for the latest Electron for Ubuntu 22
echo "  - Retrieving Ubuntu 22 RStudio (electron) daily metadata"
curl --silent https://dailies.rstudio.com/rstudio/spotted-wakerobin/index.json -o ./index.json

# Get the DEB URL and name
set DEB (cat ./index.json | jq -r .electron.platforms.jammy.link)
set rstudiofile (cat ./index.json | jq -r .electron.platforms.jammy.filename)
set VER (cat ./index.json | jq -r .electron.platforms.jammy.version)

# Download the file
curl -O "$DEB"

# Install latest Rstudio
echo "  - Installing Ubuntu 22 RStudio (electron) daily"
#sudo gdebi $rstudiofile
sudo apt -y install (string join '' ./ $rstudiofile)

# Remove instalation file
echo "  - Cleaning Up"
rm $rstudiofile
rm index.json

echo "DONE"
