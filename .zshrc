
# Tilix VTE fix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh/antigen.zsh



#######################
#                     #
#       Antigen       #
#                     #
#######################

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found


# Custom bundles/plugins
antigen bundle common-aliases
antigen bundle docker
antigen bundle git-extras
antigen bundle git-flow
antigen bundle github
antigen bundle python
antigen bundle repo
antigen bundle sudo
antigen bundle vagrant
antigen bundle web-search
antigen bundle djui/alias-tips
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Set the used theme
antigen theme romkatv/powerlevel10k
#antigen theme juanghurtado # this is for servers

antigen apply



#######################
#                     #
#       Aliases       #
#                     #
#######################

unalias rm      # adds -i flag
unalias duf     # idk, wierd alias
unalias -s pdf  # suffix alias ('$ readme.pdf' -> '$ acroread readme.pdf'

alias -s pdf=evince

alias dc=docker-compose
alias ip="ip -c"
#alias ls='colorls --gs --sd' # if colorls is installed

alias data-wine="WINEPREFIX=/mnt/data/programs/windows wine"
alias data-winetricks="WINEPREFIX=/mnt/data/programs/windows winetricks"

# Modern UNIX
alias cat=bat
alias ping=gping
alias dig="dog A AAAA MX TXT NS SOA"
alias ls="exa --icons --classify --all --header --group --modified --changed --git --long --group-directories-first"

#alias git=hub # Uncomment if hub is installed


#######################
#                     #
#      ENV  vars      #
#                     #
#######################


export EDITOR="/usr/bin/vim"
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:${GOPATH//://bin:}/bin"
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


#######################
#                     #
#       Configs       #
#                     #
#######################

# alias-tips 
export ZSH_PLUGINS_ALIAS_TIPS_FORCE=0       # Force usage of aliases
export ZSH_PLUGINS_ALIAS_TIPS_EXPAND=1      # Expand aliases
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "    # Alias tip text
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES="_ ll vi"    # Alias tip exclude list
export ZSH_PLUGINS_ALIAS_TIPS_REVEAL=0      # Show command behind alias

command -v bat > /dev/null && export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#######################
#                     #
#      Functions      #
#                     #
#######################

function mcd() {
    mkdir -p $1
    cd $1
}

function cdtmp() {
    temp=$(mktemp -d)
    cd $temp
}

#######################
#                     #
#         Misc        #
#                     #
#######################


#######################
#                     #
#    Final includes   #
#                     #
#######################

# asdf-vm
([[ -f ~/.asdf/asdf.sh ]] && source ~/.asdf/asdf.sh) || ([[ -f /opt/asdf-vm/asdf.sh ]] && source /opt/asdf-vm/asdf.sh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.zsh/.p10k.zsh ]] && source ~/.zsh/.p10k.zsh
