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

function l {
    sed ':x s/\(^\|\t\)\t/\1-\t/; t x' | column -t | less -S 
}

export PATH=$PATH:~/work/fasd

export R_HISTFILE=~/.Rhistory

unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH
