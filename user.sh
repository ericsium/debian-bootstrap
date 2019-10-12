#!/bin/sh
set -x
git clone https://github.com/ericsium/dotfiles.git
mv .bashrc .bashrc.old.$$
(cd dotfiles && ./install)

#Bootstrap pyenv for installs
export PATH="/home/$USER/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install 3.6.9
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
pyenv virtualenv 3.6.9 global-3.6.9
pyenv global global-3.6.9
