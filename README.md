My neovim configuration.

## Guidelines

My simple neovim configuration for development.

### Prerequests
- Node.js, npm and yarn.
- Because of the [problem](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting), I should get clang first.
- [fd](https://github.com/sharkdp/fd) is requried for `find_files` of `telescope`.
- [ripgrep](https://github.com/BurntSushi/ripgrep) is required for `live_grep` of `telescope`.
- [git bash](https://git-scm.com/downloads) if using Windows.

### Download Cascadia Nerd Font
[CascadiaCode](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode)

### Install Copilot

```
:Copilot setup
```
Or use `Copilot! setup` that will allow you to open the browser manually.

### Set neovim as the default editor

#### Windows

Copy the scripts below into a file named `OpenByNeo.bat`
```
nvim %1
```
Right click the file you want to open, select `Open with` -> `Choose another app` -> `Look for another app in this PC`, find `OpenByNeo.bat`. Remeber to check `Always use this app to open *.* files`.
