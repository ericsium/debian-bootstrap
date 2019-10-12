#!/bin/sh
git clone https://github.com/ericsium/dotfiles.git
mv .bashrc .bashrc.old.$$
(cd dotfiles && ./install)
curl https://pyenv.run | bash
