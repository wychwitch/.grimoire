# .grimoire
The collection of all my dotfiles

## steps
install these
```bash
apt-get install ssh git python3 pip3
pip install dotbot
```
clone this repo

also install [brew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
install the brew bundle
```
brew bundle --file ~/.grimoire/Brewfile
```

run the dotbot installation
```
dotbot -c install.conf.yaml
```
## todo
- [ ] learn how to use *defaults* to restore system prefs if needed
- [ ] organize these steps into their own scripts
- [ ] look into using [dotbot](https://github.com/anishathalye/dotbot)
- [ ] checkout [dotfiles.github.io](dotfiles.github.io) and see what other people got goin on

