## bashrc
## Yasuto Souma
##

# {{{1 General Settings
# Set the pager to less
export PAGER=less
# Display@pager filename,number,percentage
export LESS='-X -i -P ?f%f:(stdin).  ?lb%lb?L/%L..  [?eEOF:?pb%pb\%..]'
# Set default Editor
export EDITOR=vim
# }}}

# {{{1 Color Settings
export LS_COLORS

if [ -f ~/.dircolors ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors ~/.dircolors)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
    fi
fi
# }}}


# Prompt custumize
PS1="\n\[\e[0;36m\]\h@\u\n[\w]\[\e[00m\] \$ "

# {{{1 alias
alias ls='ls -CF color=auto'
alias la='ls -a'

cdls(){
	\cd "$@" && la
}
alias cd="cdls"

# }}}
