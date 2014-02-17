#############################################
### OSX specific fucntions and commands

function dxl {
    ### replace mac excel \r line endings
    sed -i 's/\r/\n/g' "$@"
}

function t {
    ssh -Yt avp2106@login.c2b2.columbia.edu ssh -Y login${1:-2}.lb
}

function sn {
    for file in $*; do 
	rsync --copy-links --partial --progress --rsh=ssh -r "avp2106@login.c2b2.columbia.edu:$file" .
    done
}

function l {
    ## sed inserts a Unicode "NO-BREAK SPACE" between neighbouring tabs
    ## so that column will show empty fields
    sed ':x s/\(^\|\t\)\t/\1 \t/; t x' | column -t -s $'\t' | less -S 
}

export PATH=$PATH:~/work/fasd

export R_HISTFILE=~/.Rhistory

unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH
