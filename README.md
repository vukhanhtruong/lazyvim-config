# LazyVim IDE configuration

<!--toc:start-->

- [Install Neovim](#install-neovim)
- [Install the Config](#install-the-config)
- [Get healthy](#get-healthy)
- [Fonts](#fonts)
- [Uninstall](#uninstall)
- [Reference](#resources)
<!--toc:end-->

## Install Neovim

```sh
brew install neovim
```

## Install the config

Make sure to remove or move your current `nvim` directory

```sh
git clone https://github.com/vukhanhtruong/lazyvim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

## Get healthy

Open `nvim` and enter the following:

```lua
:checkhealth
```

## Fonts

I recommend using the following [repo](https://github.com/ronniedroid/getnf) to get a "Nerd Font" (Font that supports icons)

## Uninstall

```sh
  rm -rf ~/.config/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.cache/nvim
  rm -rf ~/.local/state/nvim
```

## Reference

[IT Man lazy-nvim-ide](https://github.com/jellydn/lazy-nvim-ide)
