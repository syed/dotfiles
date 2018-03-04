#!/bin/bash
if [ -n "$(command -v yum)" ]; then
	PKGMGR=yum
        OSTYPE=redhat
elif [ -n "$(command -v apt-get)" ]; then
	PKGMGR=apt-get
        OSTYPE=debian
fi

setup_vim(){
        ln -s $PWD/.vimrc ~/.vimrc
        ln -s $PWD/.vim/ ~/.vim
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
}

setup_screen(){
        ln -s $PWD/.screenrc  ~/.screenrc
}

setup_tmux(){
	if [ -z "$(command -v tmux)" ]; then
		sudo $PKGMGR install -y tmux
	fi
        ln -s $PWD/.tmux.conf ~/.tmux.conf
}

setup_shell(){
        ln -s $PWD/.bashrc ~/.bashrc 
        ln -s $PWD/bin ~/bin 
	sudo $PKGMGR install -y bash-completion
}

setup_other(){
        ln -s $PWD/.gitconfig ~/.gitconfig 
        ln -s $PWD/.gitignore ~/.gitignore
}

cleanup(){
        rm -f ~/.vim ~/.vimrc
        rm -f ~/.bashrc ~/.screenrc 
        rm -f ~/.gitignore ~/.gitconfig
        rm -f ~/.tmux.conf
	rm -f ~/bin
}

cleanup
setup_vim
setup_screen
setup_tmux
setup_shell
setup_other
