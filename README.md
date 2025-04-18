# Steam-Deck-Installed-Games-List
A BaSH script that will list off all Steam games installed on an external Micro SD card, or the Internal Storage

Running is very simple, in a Terminal, change directory to the project folder and run ./installed.sh passing in the name of a drive, eg. ./installed.sh main, or passing in 'internal' to have the script look at the internal storage of the Steam Deck.

The script will then print to the terminal a list of installed games based on their folder names which can be redirected to a text file for future reference.  If you use external launchers such as Epic and GOG then so long as your folders are named epic and gog the script will do the same for those, or you can modify the script to set your own names for the variables $epic and $gog.
