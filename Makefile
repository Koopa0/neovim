# Makefile

# 定義默認目標
.PHONY: all
all: build-neovim

# 定義構建 Neovim 
.PHONY: build-neovim
build-neovim:
	nix-build neovim.nix -o neovim

