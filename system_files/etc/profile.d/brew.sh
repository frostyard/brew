#!/usr/bin/env bash

# Prioritize system binaries to prevent brew overriding things like dbus
# See: https://github.com/ublue-os/brew/blob/54b30cc07d3211fca65ca5cc724e9812c8c79b77/system_files/usr/lib/systemd/system/brew-upgrade.service#L17-L22
if [[ -d /home/linuxbrew/.linuxbrew && $- == *i* ]] ; then
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
  [ -z "${MANPATH-}" ] || export MANPATH="${MANPATH#:}:"
  export INFOPATH="${INFOPATH}:/home/linuxbrew/.linuxbrew/share/info"
  export PATH="${PATH}:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin"
  if [ "$(basename $(readlink /proc/$$/exe))" == "zsh" ] ; then
    fpath[1,0]="/home/linuxbrew/.linuxbrew/share/zsh/site-functions"
  fi
fi
