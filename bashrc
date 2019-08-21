if [[ -d ~/.bash ]]; then
  for f in ~/.bash/*.bash; do source $f; done
fi

