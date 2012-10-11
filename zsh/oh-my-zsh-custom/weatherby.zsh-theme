function prompt_char {
    git branch >/dev/null 2>/dev/null && echo ':. ' && return
    hg root >/dev/null 2>/dev/null && echo ':. ' && return
}

function git_com {
echo $(git_prompt_info)
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Save a lightning bolt to a local variable if the last command exited with success.
local bolt="%(?,%{$fg[yellow]%}ϟ%{$reset_color%},%{$fg[red]%}ϟ%{$reset_color%})"


# Show the relative path on one line, then the smiley.
PROMPT='
%~$(git_com)
%{$fg[red]%}[$HOST]%{$reset_color%}${bolt}  %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
