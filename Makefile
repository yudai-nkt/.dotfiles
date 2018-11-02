DOTDIR := $(PWD)
EXCLUDES := .gitignore Makefile README.md
DOTFILES := $(filter-out $(EXCLUDES), $(shell git ls-files))

list:
	@echo 'Dotfiles to be deployed are as follows.'
	@echo $(DOTFILES) | tr  ' ' '\n'

symlink:
	@echo 'Symlink dotfiles into home directory.'
	@$(foreach dotfile, $(DOTFILES), ln -sfnv $(DOTDIR)/$(dotfile) $(HOME)/$(dotfile);)

update:
	@echo 'Update this repository.'
	git pull origin master

install: update symlink
	@exec $${SHELL} --login
