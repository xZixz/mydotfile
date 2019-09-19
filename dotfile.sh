## -------------- My Dotfile -------------- ##
cd

## Set up Vim

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

VIMRC_FOLDER="$HOME/myvimrc/"
if [[ -d $VIMRC_FOLDER ]]; then
    if [[ -d  "$VIMRC_FOLDER/.git" ]]; then
	# There's myvimrc repo already, pull the repo
	cd $VIMRC_FOLDER
	git pull origin master
	cd
    else
	# There's myvimrc folder, but it's not the my repo, pull the repo
	rm -r $VIMRC_FOLDER
	git clone git@github.com:xZixz/myvimrc.git
    fi
else
    # There's no myvimrc folder, pull the repo
    git clone git@github.com:xZixz/myvimrc.git
fi

# Soft link myvimrc/.vimrc
rm .vimrc
ln -s myvimrc/.vimrc .vimrc
