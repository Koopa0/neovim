{ pkgs ? import <nixpkgs> {} }:

let
  myVimConfig = pkgs.writeTextDir "config/nvim/init.vim" ''
    let mapleader = " "

    " 插件管理
    source ~/.config/nvim/plugins.vim

    " 通用配置
    source ~/.config/nvim/configs.vim

    " LSP 配置
    source ~/.config/nvim/lsp.vim

    " SQL 配置
    source ~/.config/nvim/sql.vim

    " Gopher 配置
    source ~/.config/nvim/gopher.vim

    " Copilot 配置
    source ~/.config/nvim/copilot.vim

    " 主题配置
    source ~/.config/nvim/ui.vim

    " 其他配置
    set number
    set tabstop=4
    set shiftwidth=4
    set expandtab
    syntax on
  '';
in
pkgs.neovim.overrideAttrs (oldAttrs: {
  buildInputs = oldAttrs.buildInputs or [] ++ [ myVimConfig ];
  postInstall = ''
    mkdir -p $out/share/nvim
    cp -r ${myVimConfig} $out/share/nvim/site
  '';
})
