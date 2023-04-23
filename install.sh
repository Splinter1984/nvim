#!/usr/bin/sh

NVIM_DIR=~/.config/nvim

echo "This script will delete all files in $NVIM_DIR if they exist"
echo "You want to continue? y-[yes] n-[no]"

read answer

if [[ "$answer" == "y" ]]; then
  rm -rf $NVIM_DIR/*
  mkdir -p $NVIM_DIR
  stow --restow --target=$NVIM_DIR/ .
fi

