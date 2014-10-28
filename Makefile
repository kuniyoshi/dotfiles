.PHONY: install uninstall
DOTFILES = inputrc\
	zshrc zshenv zsh.d\
	zsh_aliases zsh_aliases.darwin14.0 zsh_aliases.linux-gnu\
	gitconfig gitignore\
	screenrc\
	vimrc vim\
	emacs.d\
	erlang\
	Rprofile
REPOSITORY = dotfiles

install: $(DOTFILES)
	cd ${HOME} && echo $? | xargs -n 1 -I % ln -shf $(REPOSITORY)/% .%

uninstall: $(DOTFILES)
	for x in $?;\
	do\
		echo unlink ${HOME}/.$$x;\
	done
