#!/bin/bash
set -eu

# Set up soft links from files to their destination (in home directory)

# Note: /bin/bash is required for ~/.* expansion in loop below

# Can't use something like 'readlink -e $0' because that doesn't work everywhere
# And HP doesn't define $PWD in a sudo environment, so we define our own
case $0 in
    /*|~*)
        SCRIPT_INDIRECT="$(dirname "$0")"
        ;;
    *)
        PWD="`pwd`"
        SCRIPT_INDIRECT="$(dirname "$PWD/$0")"
        ;;
esac

BASEDIR="$(cd "$SCRIPT_INDIRECT" ; pwd -P)"

for f in $(find "$BASEDIR" -type f -printf "%P\n"); do
    DIR="$(dirname "$f")"
    FILE="$(basename "$f")"

    [ $FILE = $(basename $0) ] && continue

    if [ $DIR = '.' ]; then 
	BASEFILE="$HOME/$FILE"
	SRCFILE="$BASEDIR/$FILE"
    else
	BASEFILE="$HOME/$DIR/$FILE"
        SRCFILE="$BASEDIR/$DIR/$FILE"
    fi

	mkdir -p $(dirname "$BASEFILE")
        if [ -h "$BASEFILE" ]; then
           echo "Updating link : $BASEFILE"
           rm "$BASEFILE"
        elif [ -d "$BASEFILE" ]; then
           echo "Replacing directory: $BASEFILE (saving old version)"
           SAVE_NAME="$BASEFILE.dotfiles.sav"
           if [ -e "$SAVE_NAME" ]; then
              SAVE_NAME="$SAVE_NAME.$(date +'%s')"
           fi
           mv "$BASEFILE" "$SAVE_NAME"
        elif [ -e "$BASEFILE" ]; then
            # if it exists but isn't a directory or a link,
            # assume it is a file. Doesn't seem worth it
            # to try to handle other things (e.g. unix sockets)
            # specially.
            echo "Replacing file: $BASEFILE"
	    SAVE_NAME="$BASEFILE.dotfiles.sav"
            if [ -e "$SAVE_NAME" ]; then
		SAVE_NAME="$SAVE_NAME.$(date +'%s')"
            fi
            mv "$BASEFILE" "$SAVE_NAME"
        else
            echo "Creating link: $BASEFILE"
        fi

        ln -s "$SRCFILE" "$BASEFILE"
done

# Make a pass deleting stale links, if any
for i in ~/.*; do
    [ ! -h "$i" ] && continue
    
    # We have a link: Is it stale? If so, delete it ...
    # Since we can't use readlink, assume that if the link is
    # not pointing to a file or a directory that it is stale.
    if [ ! -f "$i" -a ! -d "$i" ]; then
        echo "Deleting stale link: $i"
        rm "$i"
    fi
done

exit 0
# X11 keys remapping
xkbcomp -xkb $DISPLAY xkbmap
#chenge these lines in xkbmap 
# caps lock behaves as shift 
    key <CAPS> {         [       Shift_L ] };
    modifier_map Shift { <CAPS> };
# disable power key on 
    key <POWR> {         [    XF86PowerOff ] };
    key <POWR> {         [    Delete ] };
# disable sleep key 
    key <I150> {         [    XF86Sleep ] };
    key <I150> {         [       Up ] }; 
                                      


xkbcomp -w 0 xkbmap $DISPLAY

