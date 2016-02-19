#aliases
alias ll="ls -alh --color"

# set the prompt
__git_prompt ()
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " Git:(%s)" "${b##refs/heads/}";
    fi
}
export PS1="\[\e[36;1m\]\u@\h \[\e[33;1m\]\w \$(__git_prompt) \n> \[\e[0m\]"

# set the default editor
export EDITOR=vim
umask 0002

export MYSQL_PS1="::mysql (\d) > "
