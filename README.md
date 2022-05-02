My neovim configuration.

## Guidelines

My simple neovim configuration for development.

### Prerequests
- Node.js and npm.
- Because of the 
[problem](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting),
I should get clang first.
- [ripgrep](https://github.com/BurntSushi/ripgrep) is required for `live_grep` and `grep_string` of `telescope`.

### Download Cascadia Nerd Font
[CascadiaCode](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode)

### Install language server

```
:LspInstall omnisharp sumneko_lua zeta_note tsserver eslint html cssls
```

### Install Copilot

```
:Copilot setup
```
Or use `Copilot! setup` that will allow you to open the browser manually.
