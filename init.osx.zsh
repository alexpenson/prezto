#############################################
### OSX specific fucntions and commands

function dxl {
    ### replace mac excel \r line endings
    sed -i 's/\r/\n/g' "$@"
}

function t {
    ssh -Yt avp2106@login.c2b2.columbia.edu ssh login${1:-2}.lb
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

function frames2x2 {
    echo '\\begin{frame}[c]
  \\frametitle{'$(basename $1|sed "s/_/\ /g")'}
  \\begin{columns}[onlytextwidth]
    \\begin{column}[c]{0.5\\textwidth}'
    if [ -f $1 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $1)'}'
    else echo ''
    fi
    echo '    \\end{column}
    \\begin{column}[c]{0.5\\textwidth}'
    if [ -f $2 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $2)'}'
    else echo ''
    fi
    echo '    \\end{column}
  \\end{columns}

  \\begin{columns}[onlytextwidth]
    \\begin{column}[c]{0.5\\textwidth}'
    if [ -f $3 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $3)'}'
    else echo ''
    fi
    echo '    \\end{column}
    \\begin{column}[c]{0.5\\textwidth}'
    if [ -f $4 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $4)'}'
    else echo ''
    fi
    echo '    \\end{column}
  \\end{columns}
\\end{frame} 
' 
}

function frames {
    if [ $# = 0 ]
    then for i in ./*.pdf
	do echo '\\begin{frame}[c]
  \\frametitle{'$(basename $i|sed "s/_/\ /g")'} 
  \includegraphics[width=\\textwidth]{'$(pwd)/$i'} 
\\end{frame} 
' 
	done
    else for i in $*
	do 
	echo '\\begin{frame}[c]'
	echo '  \\frametitle{'$(basename $i|sed -e "s/_/\ /g")'}'
	echo '\includegraphics[width=\\textwidth]{'$( greadlink -m $i)'}'
	echo '	\\end{frame}'
	echo ''
	done
    fi
}

function frames3x2 {
    echo '\\begin{frame}[c]
  \\frametitle{'$(basename $1|sed "s/_/\ /g")'}
  \\begin{columns}[onlytextwidth]
    \\begin{column}[c]{0.33\\textwidth}'
    if [ -f $1 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $1)'}'
    else echo ''
    fi
    echo '    \\end{column}
    \\begin{column}[c]{0.33\\textwidth}'
    if [ -f $2 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $2)'}'
    else echo ''
    fi
    echo '    \\end{column}
    \\begin{column}[c]{0.33\\textwidth}'
    if [ -f $3 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $3)'}'
    else echo ''
    fi
    echo '    \\end{column}
  \\end{columns}

  \\begin{columns}[onlytextwidth]
    \\begin{column}[c]{0.33\\textwidth}'
    if [ -f $4 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $4)'}'
    else echo ''
    fi
    echo '    \\end{column}
    \\begin{column}[c]{0.33\\textwidth}'
    if [ -f $5 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $5)'}'
    else echo ''
    fi
    echo '    \\end{column}
    \\begin{column}[c]{0.33\\textwidth}'
    if [ -f $6 ]; then echo '\includegraphics[width=\\textwidth]{'$(greadlink -m $6)'}'
    else echo ''
    fi
    echo '    \\end{column}
  \\end{columns}
\\end{frame} 
' 
}

export PATH=$PATH:~/work/fasd
export PATH=$PATH:/usr/local/texlive/2008/bin/universal-darwin

export R_HISTFILE=~/.Rhistory

unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH
