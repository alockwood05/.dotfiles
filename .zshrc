# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

plugins=(git, gitfast)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To use coreutils `brew install coreutils`
export COREUTILS_GNUBIN_DIR="/usr/local/opt/coreutils/libexec/gnubin/";
export PATH="$COREUTILS_GNUBIN_DIR:$PATH"
export EDITOR=vim
export MANPATH="/usr/local/man:$MANPATH"

#Ruby
# => Brew install chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh


## Customizations
# Better `ls`
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -p'
# Better `grep`
export GREP_OPTIONS='--color=auto'

# brew install grc
# Colorized `traceroute`, `tail`, `head` (requires prepending command with `grc`)
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh


alias dc='docker-compose'
alias hist='history | grep '
alias vimcc='rm ~/.vim-tmp/* ~/.vim-tmp/.*'
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

#
# gitfast updated for local only bash completion
# git bash completion
alias gcor='git checkoutr';
# `~/.oh-my-zsh/plugins/gitfast/git-completion.bash`

# ```
# 		# __gitcomp_nl "$(__git_refs '' $track)"
#                 # https://gist.github.com/mmrko/b3ec6da9bea172cdb6bd83bdf95ee817
#                 if [ "$command" = "checkoutr" ]; then
#                   __gitcomp_nl "$(__git_refs '' $track)"
#                 else
#                   __gitcomp_nl "$(__git_heads '' $track)"
#                 fi
# 		;;
# ```





#
# One Medical specific
#

# Automatically jump to your onelife directory from anywhere
alias onelife='cd ~/Code/onemedical/onelife'
alias onelife-ssh='docker exec -it onelife_onelife_1 /bin/bash'
alias onelife-seed='bundle exec rake onelife:seeder:seed_from_db_dump'
alias onelife-migrate='bin/rails db:migrate RAILS_ENV=development'
alias onelife-inventory-index='rake onelife:search_index:reindex["AppointmentInventories"]'
alias be='bundle exec'
alias onelife-assets='bundle exec rake assets:precompile assets:clean RAILS_ENV=development'
alias onelife-ssh-seoul='bundle exec beans ssh exec -a onelife-seoul -i ~/.ssh/1life-core.pem'

# for use with `binding.pry` debugger
alias onelife-attach='docker attach onelife_onelife_1'
