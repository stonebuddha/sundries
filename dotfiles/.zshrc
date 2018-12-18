export TERM="xterm-256color-italic"

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"

ANTIGEN="$HOME/.config/antigen.zsh"
source "$ANTIGEN"
antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle svn-fast-info

antigen bundle colorize
antigen bundle github
antigen bundle python
antigen bundle rupa/z z.sh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

function _fish_collapsed_pwd() {
	local pwd="$1"
	local home="$HOME"
	local size=${#home}
	[[ $# == 0 ]] && pwd="$PWD"
	[[ -z "$pwd" ]] && return
	if [[ "$pwd" == "/" ]]; then
		echo "/"
		return
	elif [[ "$pwd" == "$home" ]]; then
		echo "~"
		return
	fi
	[[ "$pwd" == "$home/"* ]] && pwd="~${pwd:$size}"
	local elements=("${(s:/:)pwd}")
	local length=${#elements}
	for i in {1..$((length-1))}; do
		local elem=${elements[$i]}
		if [[ ${#elem} > 1 ]]; then
			elements[$i]=${elem[1]}
		fi
	done
	local IFS="/"
	echo "${elements[*]}"
}

if [ $UID -eq 0 ]; then
	export PROMPT='%f%n@%m %F{1}$(_fish_collapsed_pwd)%f# '
else
	export PROMPT='%f%n@%m %F{2}$(_fish_collapsed_pwd)%f> '
fi
export RPROMPT="%F{red}%(?..%?)%f"

unsetopt correct_all
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

. /Users/di/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/Users/di/.cask/bin:$PATH"
