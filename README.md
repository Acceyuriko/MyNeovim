My neovim configuration.

## Guidelines

My simple neovim configuration for development.

### Prerequests
- Node.js, npm and yarn.
- [fd](https://github.com/sharkdp/fd) is required for `find_files` of `telescope`.
- [ripgrep](https://github.com/BurntSushi/ripgrep) is required for `live_grep` of `telescope`.
- [eslint_d](https://github.com/mantoni/eslint_d.js) is required for 'null-ls'.
- [neovide](https://github.com/neovide/neovide) is recommended.
- Windows
  - [git bash](https://git-scm.com/downloads)
  - [chocolatey](https://docs.chocolatey.org/en-us/choco/setup#non-administrative-install)
  - Because of the [problem](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting), clang is required.
  - `make` and `mingw` is required for compiling.
  - `sed` is required for `vim-spectre`.
  - Run `choco install make mingw llvm sed` in powershell with admin privileges.
  - [xdg-open-wsl](https://github.com/cpbotha/xdg-open-wsl) is required for opening files in WSL.

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
Right click the file you want to open, select `Open with` -> `Choose another app` -> `Look for another app in this PC`, find `OpenByNeo.bat`. Remember to check `Always use this app to open *.* files`.
