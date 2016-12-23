#!/usr/bin/env bash

dir=/usr/local/etc/bash_completion.d/

[[ -f $dir/ag.bashcomp.sh ]]      && source $dir/ag.bashcomp.sh
[[ -f $dir/git-completion.bash ]] && source $dir/git-completion.bash
[[ -f $dir/git-prompt.bash ]]     && source $dir/git-prompt.bash

