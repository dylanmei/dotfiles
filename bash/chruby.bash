#!/usr/bin/env bash

[[ -f /usr/local/share/chruby/chruby.sh ]] && \
  source /usr/local/share/chruby/chruby.sh &&
  chruby ruby-2.4.1
