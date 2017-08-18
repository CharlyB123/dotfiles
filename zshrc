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

# This will set the default prompt to the walters theme

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh/site-contrib/powerline.zsh

alias ls='ls --color'
alias steam-wine='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe >/dev/null 2>&1 &'
alias '$='
alias '#=sudo'
alias "colw=perl -pe 's/( +)/\\033[41m\$1\\033[00m/g'"
alias g=git
alias gxdep='f() { gx deps --tree --highlight=$1 };f'

alias pd='popd'
alias gwc='pushd $(cat gx-workspace-update.json | jq .Current --raw-output)'
alias cdgw='f() { export GOPATH=$(cat gx-workspace-update.json | jq .GoPath --raw-output); pushd $(gofind $1) };f'
alias cdgo='f() { cd $(gofind $1) };f'
alias cdgosrc='cd ~/.opt/go/src/github.com'
alias vimp='f() { vim $(which $1) };f'
alias gxtree='f() { paste <(gx deps --tree --highlight=$1) <(gx deps --tree --highlight=$1 | awk -v gopath=$GOPATH '"'"'{print gopath "/src/gx/ipfs/"$(NF-1)"/"$(NF-2)"/package.json"}'"'"' | sed -r '"'"'s/\x1b\[[0-9;]*m?//g'"'"' | xargs cat | jq .gx.dvcsimport --raw-output | xargs -i cat $GOPATH/src/{}/package.json | jq .version --raw-output) | awk -v yellow="$(tput setaf 3)" -v reset="$(tput sgr0)" '"'"'{if($(NF)==$(NF-1)){ print $0 }else{ print yellow $0 reset }}'"'"'};f'

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
