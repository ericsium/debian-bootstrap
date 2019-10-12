#!/bin/sh
set -x
git clone https://github.com/ericsium/dotfiles.git
mv .bashrc .bashrc.old.$$
(cd dotfiles && ./install)
curl https://pyenv.run | bash
exec $SHELL
pyenv install 3.6.9
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
pyenv virtualenv 3.6.9 global-3.6.9
pyenv global global-3.6.9
