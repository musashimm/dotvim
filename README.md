
# Personal VIM configuration

## Configure Vundle

    cd ~
    git clone https://github.com/musashimm/dotvim.git ~/.vim
    ln -fs ~/.vim/vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Install Plugins

From Vim execute:

    :PluginInstall

## Compile command-t

Check ruby version Vim is bundled to. From Vim execute command:

    :ruby puts "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"

After you set proper version of ruby using (rvm or rbenv), issue commands:

Install system ruby version and devel libs for ruby:

    yum install ruby ruby-devel

Compile command-t plugin:

    cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
    ruby extconf.rb
    make
