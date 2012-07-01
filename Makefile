DOTFILES = inputrc\
	zshrc zshenv zsh_aliases zsh_aliases.darwin11.0 zsh_aliases.linux-gnu\
	gitconfig gitignore\
	screenrc\
	vimrc vim\
	emacs.d
REPOSITORY = dotfiles
BACKUPDIR = backup

backup: $(DOTFILES)
	mkdir -p $(BACKUPDIR)
	for x in $?; do\
		cp -R ${HOME}/.$$x $(BACKUPDIR)/$$x;\
	done

clean:
	rm -Rf $(BACKUPDIR)

install: $(DOTFILES)
	for x in $?; do\
		(cd ${HOME} && ln -fs $(REPOSITORY)/$$x .$$x);\
	done

uninstall: $(DOTFILES)
	for x in $?; do\
		(cd ${HOME} && unlink .$$x);\
	done


