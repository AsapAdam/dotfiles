#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude "config" --exclude ".idea" --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "brew.sh" --exclude "cask.sh" --exclude "composer.sh" --exclude "gems.sh" --exclude ".osx" --exclude "README.md" -avh . ~;
	source ~/.bash_profile;
}

if [ "${1}" == "--force" -o "${1}" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ ${REPLY} =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
