#!/bin/sh
git clone https://github.com/ericsium/dotfiles.git
mv .bashrc .bashrc.old.$$
(cd dotfiles && ./install)
curl https://pyenv.run | bash
source ~/.bashrc
pyenv install 3.6.9
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv


