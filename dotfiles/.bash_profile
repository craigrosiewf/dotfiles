# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{sensible,path,bash_prompt,exports,aliases,functions,extra,fzf-git.sh}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Enable bash completion
[[ -r "/etc/profile.d/bash_completion.sh" ]] && . "/etc/profile.d/bash_completion.sh"

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_wrap__git_main &> /dev/null && [ -f .git-completion.bash ]; then
    complete -o default -o nospace -F __git_wrap__git_main g
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Enable fzf auto-completion & key bindings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Also use ag for the fzf ctrl+T command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set default options for fzf
export FZF_DEFAULT_OPTS="--height 30% --reverse --cycle"

export EDITOR=`command -v vim`

# Automate ssh-agent startup
# https://superuser.com/questions/1152833/save-identities-added-by-ssh-add-so-they-persist
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# Prevent pip from installing packages outside of a virtualenv
# https://switowski.com/blog/disable-pip-outside-of-virtual-environments
export PIP_REQUIRE_VIRTUALENV=true

echo "System online ✔︎"

