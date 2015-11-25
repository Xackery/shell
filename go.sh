#Source: https://golang.org/dl/
#!/bin/bash
set -e

echo "Getting Go..."
FILE="go1.5.1.linux-386.tar.gz..."
if [ `uname -m | grep 64 | wc -l` -ge 1 ]; then  
	FILE="go1.5.1.linux-amd64.tar.gz" #Get 64 bit version
fi

echo "Downloading $FILE"
curl --remote-name https://storage.googleapis.com/golang/$FILE
if [ ! -f $FILE ]; then
    echo "File failed to download"
    exit
fi

echo "Extracting $FILE to /usr/local/go..."
tar -C /usr/local -xzf $FILE

echo "Removing $FILE"
rm $FILE

echo "Making a go path in home directory"
mkdir ~/go
echo "Last Steps: You need to copy the below line and add to ~/.bashrc, likely bottom, or append to previous lines"
echo "export PATH=$PATH;/usr/local/go/bin"
echo "export GOPATH=~/go"

