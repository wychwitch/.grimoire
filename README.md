# .grimoire
The collection of all my dotfiles
## Programs
### (arch) linux
+ bat
+ arttime
+ exa
+ zsh
 + zsnap
+ nushell
+ elvish
+ neovim
+ rust
+ brew
+ wezterm (on host machine)
+ emacs (on host machine)

#### Commands
```bash
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git
source zsh-snap/install.zsh
```

### Windows
+ win32yank

#### Commands
    
```powershell
scoop install win32yank

 ```

## steps
TODO: fill this out with new dotter workload
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

