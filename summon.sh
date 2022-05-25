
#!/bin/bash

## all the symbolic links
echo "Linking gitconfig"
ln -s ~/.grimoire/.gitconfig ~/.gitconfig
echo "Linking zshrc "
ln -s ~/.grimoire/.zshrc ~/.zshrc
echo "Linking ssh_config"
ln -s ~/.grimoire/ssh_config ~/.ssh/config
echo "Linking posh-themes "
ln -s ~/.grimoire/.posh-themes ~/.posh-themes
echo "Linking li commmand "
sudo ln -s ~/.grimoire/commands/li /usr/local/bin/li
