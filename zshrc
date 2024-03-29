# modify the prompt to contain git branch name if applicable

setopt promptsubst

setopt hist_ignore_all_dups inc_append_history appendhistory
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

setopt extendedglob
setopt nomatch notify
unsetopt beep
bindkey -v

autoload -Uz compinit
compinit

PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=0

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors
colors

# enable coloured output from ls, etc
export CLICOLOR=1

export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH"

# chruby and ruby auto-switcher
if [ -s "/usr/local/opt/chruby/share/chruby/chruby.sh" ] ; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# nvm
if [ -s "/usr/local/opt/nvm/nvm.sh" ] ; then
  export NVM_DIR=~/.nvm
  source /usr/local/opt/nvm/nvm.sh
fi

[ -s "~/Users/austin/.secrets" ] && source "/Users/austin/.secrets"

# SCM Shortcuts
[ -s "/Users/austin/.scm_breeze/scm_breeze.sh" ] && source "/Users/austin/.scm_breeze/scm_breeze.sh"
eval "$(scmpuff init -s)"


[ -s "/Users/austin/.iterm2_shell_integration" ] && source /Users/austin/.iterm2_shell_integration.zsh
[ -s "/usr/local/share/zsh/site-functions" ] && source /usr/local/share/zsh/site-functions
