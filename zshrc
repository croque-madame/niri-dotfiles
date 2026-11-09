# -------HOW TO USE--------
# Symlink this file to ~/.zshrc
# Symlink ~/.config/p10k/p10k.zsh to ~/.p10k.zsh
# -------------------------

fastfetch --disable-linewrap

# powerlevel10k stuff
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
POWERLEVEL9K_CONFIG_FILE=~/.config/p10k/p10k.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
bindkey "^[[3~" delete-char
HISTFILE=~/.zsh_history
SAVEHIST=250
setopt HIST_IGNORE_DUPS

# Home, End binds
bindkey '\e[1~'   beginning-of-line
bindkey '\e[H'    beginning-of-line
bindkey '\eOH'    beginning-of-line
bindkey '\e[2~'   overwrite-mode
bindkey '\e[3~'   delete-char
bindkey '\e[4~'   end-of-line
bindkey '\e[F'    end-of-line
bindkey '\eOF'    end-of-line

# aliases
alias mirrors='rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist;rate-mirrors cachyos | sudo tee /etc/pacman.d/cachyos-mirrorlist;'
alias nv='nvim'

## git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gf='git fetch'
alias gP='git push'
alias gp='git pull'
alias gb='git branch'
alias gm='git merge'
alias gS='git switch'
alias grm='git rm'
alias gl='git log --oneline'
alias gL='git log'
alias g='git'

## pacman aliases
alias pm='pacman'
## pac update
alias psyu='sudo pacman -Syu'
# pac install
alias pi='sudo pacman -S'
# pac uninstall
alias pu='sudo pacman -Rn'
# pac search repos
alias psr='pacman -Ss'
# pac query
alias pq='pacman -Q'
# pac query grep
alias pacgrep='pacman -Q | grep'
# use fzf to list packages, can be used to find unneeded pkges
alias pkglist='pacman -Qetq | fzf -m --preview "pacman -Qi {}" | xargs -ro sudo pacman -Rns'

## NetworkManager aliases
wgadd() {
    if [ -z "$1" ]; then
        echo "Error: Please provide the path to your .conf file."
        return 1
    fi
    local file_path="$1"
    local profile_name=$(basename "$file_path" .conf)

    sudo nmcli connection import type wireguard file "$file_path" && \
    sudo nmcli connection modify "$profile_name" connection.autoconnect no && \
    echo "Successfully imported '$profile_name'"
}
alias wgdel='sudo nmcli connection delete'
alias nmlist="nmcli connection show"


# yazi stuff
EDITOR='nvim'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
