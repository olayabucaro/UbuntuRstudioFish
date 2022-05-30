#!/usr/bin/env fish

echo "Downloading and installing latest Rstudio Preview"

# Find dl URL of latest Rstuido preview version
set rstudiourl (curl https://www.rstudio.com/products/rstudio/download/preview | grep -o -E 'href="([^"#]+)"' | grep -o -E '(http|https)://s3.amazonaws.com/rstudio-ide-build/desktop/bionic/amd64/rstudio-[^/"]+-amd64.deb' | head -1)
 
# Download the file
curl -O "$rstudiourl"
 
# Get file name 
set rstudiofile (string split -r -m1 / $rstudiourl |tail -1)

# Install latest Rstudio
sudo apt -y install (string join '' ./ $rstudiofile)

# Remove instalation file
rm $rstudiofile
