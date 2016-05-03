if [[ -f /etc/profile.d/fzf.zsh ]]; then
  _fzf_compgen_path() {
    echo "$1"
    \find -L "$1" \
      -name .git -prune -o -name .svn -prune -o \( -type d -o -type f -o -type l \) \
      -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
  }

  _fzf_compgen_dir() {
    \find -L "$1" \
      -name .git -prune -o -name .svn -prune -o -type d \
      -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
  }

  source /etc/profile.d/fzf.zsh
fi

