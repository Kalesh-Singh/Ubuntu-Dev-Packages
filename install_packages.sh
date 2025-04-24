#!/bin/bash

apt_packages=(
	chromium-browser
	clang
	fish
	fonts-firacode
	kitty
	llvm
	neofetch
	gdb-multiarch
	ccache clang
	clangd
	lld
	libguestfs-tools
	libssl-dev
	trace-cmd
	python3-pip
	jsonnet
	libelf-dev
	bison
	bindfs
	mmdebstrap
	proot
	systemtap
	flex
	yacc
	bc
	debian-archive-keyring
)

snap_packages=(
	ccls
	nvim
)

commands=(
	"curl -sS https://starship.rs/install.sh | sh"
)

sudo apt update

# Install apt packages
for package in "${apt_packages[@]}"; do
	sudo apt install -y "$package"
done

# Install snap packages
for package in "${snap_packages[@]}"; do
	sudo snap install "$package" --classic
done

# Custom installation commands
for cmd in "${commands[@]}"; do
	eval "sudo $cmd"
done
