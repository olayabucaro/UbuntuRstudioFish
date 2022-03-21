#!/usr/bin/env fish

echo "Downloading and installing latest Rstudio"

# Find dl URL of latest Rstuido version
set rstudiourl (curl https://www.rstudio.com/products/rstudio/download/#download | grep -o -E 'href="([^"#]+)"' | grep -o -E '(http|https)://download1.rstudio.org/desktop/bionic/amd64/rstudio-[^/"]+-amd64.deb' | head -1)
 
# Download the file
curl -O "$rstudiourl"
 
# Get file name 
set rstudiofile (string split -r -m1 / $rstudiourl |tail -1)

# Install latest Rstudio
sudo gdebi $rstudiofile
