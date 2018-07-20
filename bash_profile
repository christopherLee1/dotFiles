set -o vi

# username@hostname:cwd$ 
export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ '

# correct colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM="xterm-256color"

export EDITOR=/usr/bin/vim

# don't clutter history with multiple instances of the same command one after the other
export HISTCONTROL=ignoredups

# for correct sorting
export LANG=C
export LC_COLLATE=C

alias ls='ls -a'
alias ll='ls -lh'
alias ldir="ls -d */"
alias less='less -S'
alias myip='ifconfig | grep inet'

# convert tab row to multiple rows, 1-indexed or zero indexed
alias tl="perl -wne '"'chomp; @w = split(/\t/, $_, -1); $i = 1; foreach $w (@w) { print "$i\t$w[$i-1]\n"; $i++; }'"'"
alias tl0="perl -wne '"'chomp; @w = split(/\t/, $_, -1); $i = 0; foreach $w (@w) { print "$i\t$w[$i]\n"; $i++; }'"'"

# OSX only
#alias Downloads='cd /Users/christopherlee/Downloads'
#export HOMEBREW_NO_AUTO_UPDATE=on
# end OSX

getColors () {
    for code in {0..255}; do
        printf "\e[38;5;${code}m"'\\e[38;5;'"$code"m"\e[0m"
    done
    printf "\n"
}

# extension of tl and tl0 to see one line of data with their field names
# strangely enough this doesn't work as an alias
withHeaders ()
{
    #head -1 $1
    pr -Jmt -w $COLUMNS <(head -1 $1 | tl) <(tail -n +2 $1 |  head -1 | tr '\t' '\n')
}
