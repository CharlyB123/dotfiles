# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=10000000

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/magik6k/.zshrc'
export GOPATH=/home/magik6k/.opt/go
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:$PATH:/home/magik6k/.opt/bin:/home/magik6k/.gem/ruby/2.3.0/bin:/usr/local/go/bin:$GOPATH/bin:/home/magik6k/bin
export EDITOR=vim

autoload -U compinit promptinit
compinit
promptinit

autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

DOTFILES="$HOME/dotfiles"

# Style
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=7

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

# History

source "$DOTFILES/zsh-histdb/sqlite-history.zsh"
source "$DOTFILES/zsh-histdb/history-timer.zsh"

autoload -Uz add-zsh-hook
add-zsh-hook preexec _start_timer
add-zsh-hook precmd  _stop_timer

_zsh_autosuggest_strategy_histdb_top() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top

# Aliases

source "$DOTFILES/zshaliases"
