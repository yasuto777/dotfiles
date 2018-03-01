# mode
local VIINS="$fg[white]-- INSERT --$reset_color"
local VICMD="$fg[yellow]-- NORMAL --$reset_color"

# {{{ vcs_info
# ${vcs_info_msg_0_} : normal message
# ${vcs_info_msg_1_} : warning message
# ${vcs_info_msg_2_} : error message

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%{$fg_bold[yellow]%}!"
zstyle ':vcs_info:git:*' unstagedstr "%{$fg_bold[red]%}+"
zstyle ':vcs_info:git:*' formats "%{$fg_bold[green]%}(%b)%c%u%f"
zstyle ':vcs_info:git:*' actionformats '(%b | %a)'

# }}}

#{{{1 RPROMPT
_refresh_rprompt(){
  vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _refresh_rprompt
#}}}

# Change the color according to the return value of the previous command.
local p_color="%(?.%{${fg[cyan]}%}.%{${fg[red]}%})"
local p_color_bold="%(?.%{${fg_bold[cyan]}%}.%{${fg_bold[red]}%})"

# {{{1 PROMPT
PROMPT="
 %{$fg[cyan]%}%n@%m [%~]%{${reset_color}%}
 ${p_color_bold}>>> %{${reset_color}%}"
# }}}

# {{{ Suggest prompt
# Suggest like a google.
SPROMPT=" %{$fg_bold[red]%}Did you mean: \
    %{${reset_color}%}%{$fg_bold[cyan]%}%r%{${reset_color}%}%{$fg_bold[red]%}?%{${reset_color}%} \
    [(y)es,(n)o,(a)bort,(e)dit] > "
# }}}

# {{{ when buffer is empty, prompt clear
_reflesh(){
        zle accept-line
        if [[ -z "$BUFFER" ]]; then
                clear
        fi
}
zle -N _reflesh
bindkey '^M' _reflesh
# }}}