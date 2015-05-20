sl-vim
======

Vim configuration files.

## Installation

    gem install homesick

    homesick clone https://github.com/solidline/sl-vim.git

    cd ~/.homsick/repos/sl-vim && git submodule update --init --recursive

### Install youcompleteme

    brew install cmake

    cd ~/.homesick/repos/sl-vim/home/.vim/bundle/youcompleteme

    ./install.sh

### Install command-t

    cd ~/.homesick/repos/sl-vim/home/.vim/bundle/vim-command-t/ruby/command-t
    rbenv global system

    ruby extconf.rb
    make

### Finalize Installation

    homesick symlink sl-vim

