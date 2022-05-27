
#!/bin/bash

## install dotdrop
sudo apt-get install python3-pip
pip3 install --user -r dotdrop/requirements.txt
sudo chmod 777 -R .git/modules/dotdrop/
