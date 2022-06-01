# .MacOS_dotfiles

Dotfiles for My MacOS config

### cloning files / Setup

`git clone --bare https://github.com/Danny-Dasilva/.MacOS_dotfiles.git` (or your fork)

`echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.MacOS_dotfiles.git/ --work-tree=$HOME"' >> $HOME/.dotfiles`

`source ~/.dotfiles `

`dotfiles checkout --force`


### How to commit or add changes

`dotfiles add $your_file `

`dotfiles commit -m "My message"`


`dotfiles push origin main`


### in case of no origin error

`dotfiles remote add origin https://github.com/Danny-Dasilva/.MacOS_dotfiles.git`


### How to update from repo
`dotfiles pull`



Links to some stuff I use on my m1 mbp:
* [kitty](https://github.com/kovidgoyal/kitty/) - Terminal
* [spacebar](https://github.com/cmacrae/spacebar/) - Status Bar
* [skhd](https://github.com/koekeishiya/skhd/) - Simple Hotkey Daemon
* [yabai](https://github.com/xorpse/yabai/) - Window Manager
* [starship](https://starship.rs/) - Shell Prompt
* [bash](https://www.zsh.org/) - Shell
* [neovim](https://neovim.io/) - Main Text Editor
* [Visual Studio Code](https://code.visualstudio.com/) - Backup IDE
<!--* [Liga SF Mono Nerd Font](https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized/) - Font-->
