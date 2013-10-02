#############################################
### OSX specific fucntions and commands

function t {
    ssh -Yt avp2106@login.c2b2.columbia.edu ssh login${1:-2}.lb
}

function sn {
    for file in $*; do 
	rsync --copy-links --partial --progress --rsh=ssh -r "avp2106@login.c2b2.columbia.edu:$file" .
    done
}

unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH
