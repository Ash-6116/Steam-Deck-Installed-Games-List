#!/bin/bash

main_dir=/run/media/deck
epic=epic # can change this based on your naming convention, ie. epic=Epic Games
gog=gog # can change this based on your naming convention, ie. gog = GOG Launcher

function warn_user () {
	echo "An $1 was provided, please rerun the script passing in one of the directory names below:"
	ls $main_dir
}

function list_games () {
	find $1 -mindepth 1 -maxdepth 1 -type d -print | sed 's!.*/!!'
}

function fetch_storefront_data () {
	if [ -d $1/steamapps ]; then # Steam games live in steamapps/common/ as folders
		echo "Steam Games:"
		list_games $1/steamapps/common
		echo ""
	fi
	if [ -d $1/epic ]; then # Epic games live in epic/ as folders
		echo "Epic Games:"
		list_games $1/$epic
		echo ""
	fi
	if [ -d $1/gog ]; then # GOG games live in gog/ as folders
		echo "GOG Games:"
		list_games $1/$gog
		echo ""
	fi
 	df -h $1 # Show the amount of free space left on the filesystem where the given directory resides
}

# Need to check if $1 is populated
if [ -z "$1" ]; then
	warn_user "empty argument"
elif [ $1 == "internal" ]; then
	echo "Internal Storage:"
	list_games "/home/deck/.local/share/Steam/steamapps/common"
else

	if [ -d "$main_dir/$1" ]; then # $1 directory exists, we can continue
		main_dir=$main_dir/$1
		# Steam games live in steamapps, GOG and Epic tend to live in gog and epic respectively, but not always, will need to ensure this in future
		echo "[$1]"
		fetch_storefront_data $main_dir
	else # $1 directory does not exist, inform user and stop
		warn_user "incorrect directory name"
	fi

fi
