!/bin/bash


ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
mkdir -p "$HOME/.vim"
ln -s $(pwd)/NERDTreeBookmarks $HOME/.vim/.NERDTreeBookmarks
ln -s $(pwd)/functions.vim $HOME/.vim/autoload/functions.vim
ln -s $(pwd)/templates $HOME/.vim/templates


# vim-plug install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#echo "OK! Now VIM will fail to start but open it and run :PlugInstall"
echo "Success!"
