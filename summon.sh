
#!/bin/bash

## install dotdrop
sudo apt-get install python3-pip
git submodule update --remote
./dotdrop
pip3 install --user -r dotdrop/requirements.txt
./dotdrop
sudo chmod 777 -R .git/modules/dotdrop/
