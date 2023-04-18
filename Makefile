.PHONY: install uninstall install_dotfiles install_config_directories uninstall_dotfiles uninstall_config_directories
DOTFILES = inputrc \
	zshrc zshenv zsh.d zsh_aliases zle.d \
	gitconfig gitignore \
	screenrc \
	vimrc vim \
	emacs.d \
	erlang \
	Rprofile
CONFIG_DIRECTORIES = config.fish config.kitty
REPOSITORY = dotfiles

install: install_dotfiles install_config_directories

uninstall: uninstall_dotfiles uninstall_config_directories

install_dotfiles: $(DOTFILES)
	cd ${HOME} && echo $? | xargs -n 1 echo | xargs -n 1 -I % ln -sf $(REPOSITORY)/% .%

install_config_directories: $(CONFIG_DIRECTORIES)
	mkdir -p ${HOME}/.config/ && cd ${HOME}/.config && echo $? | xargs -n 1 echo \
		| perl -lpe 's{.*\.}{}' \
		| xargs -I % ln -sf ~/$(REPOSITORY)/config.% %

uninstall_dotfiles: $(DOTFILES)
	for x in $?;\
	do\
		unlink ${HOME}/.$$x;\
	done

uninstall_config_directories: $(CONFIG_DIRECTORIES)
	echo $? | xargs -n 1 echo | perl -lpe 's{.*\.}{}' | xargs -I % unlink ${HOME}/.config/%
