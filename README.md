
## Personal VIM configuration

cd ~
git clone https://github.com/musashimm/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
