.PHONY: install uninstall
DOTFILES = inputrc \
	zshrc zshenv zsh.d zsh_aliases zle.d \
	gitconfig gitignore \
	screenrc \
	vimrc vim \
	emacs.d \
	erlang \
	Rprofile
REPOSITORY = dotfiles

install: $(DOTFILES)
	cd ${HOME} && echo $? | xargs -n 1 echo | xargs -n 1 -I % ln -sf $(REPOSITORY)/% .%

uninstall: $(DOTFILES)
	for x in $?;\
	do\
		echo unlink ${HOME}/.$$x;\
	done
