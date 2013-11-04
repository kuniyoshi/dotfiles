.PHONY: install uninstall
DOTFILES = inputrc\
	zshrc zshenv zsh.d\
	zsh_aliases zsh_aliases.darwin12.0 zsh_aliases.darwin13.0 zsh_aliases.linux-gnu\
	gitconfig gitignore\
	screenrc\
	vimrc vim\
	emacs.d
REPOSITORY = dotfiles

install: $(DOTFILES)
	cd ${HOME} && echo $? | xargs -n 1 -I % ln -shf $(REPOSITORY)/% .%

uninstall: $(DOTFILES)
	for x in $?\
		unlink ${HOME}.$$x\
	done
