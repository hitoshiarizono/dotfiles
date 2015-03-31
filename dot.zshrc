# .zshrc
#

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

case ${UID} in
  0)
    LANG=C
    ;;
esac

autoload colors
colors
PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt print_eight_bit

bindkey -e
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt share_history

## zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)


autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

typeset -U path cdpath fpath manpath
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

path=(/usr/local/bin(N-/) ${path})



case "${OSTYPE}" in
  darwin*)
    eval `gdircolors $HOME/.dircolors`
    alias ls='gls --color=auto'
    ;;
  linux*)
    eval `dircolors $HOME/.dircolors`
    alias ls='ls --color=auto'
    ;;
esac
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## anyenv
#if [ -d $HOME/.anyenv ] ; then
#  export PATH="$HOME/.anyenv/bin:$PATH"
#  eval "$(anyenv init -)"
#  for D in `ls $HOME/.anyenv/envs`
#  do
#    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
#  done
#fi

## pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#export PYENV_ROOT=/usr/local/opt/pyenv

## tmux
if [ -n $TMUX ] ; then
  alias ssh='TERM=xterm-256color ssh'
fi

