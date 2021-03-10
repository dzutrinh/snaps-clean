# Get rid of old revisions of snaps to save disk space
# Close all snap instances before running this script.
# This script comes with ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISKS.

#!/bin/bash
set -eu

LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
