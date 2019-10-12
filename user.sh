#!/bin/sh
set -x
git clone https://github.com/ericsium/dotfiles.git
mv .bashrc .bashrc.old.$$
(cd dotfiles && ./install)
curl https://pyenv.run | bash
sh pyenv install 3.6.9
sh git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
sh pyenv virtualenv 3.6.9 global-3.6.9
sh pyenv global global-3.6.9
