{ pkgs }:

with pkgs; [

  ###
  ### Utilities
  ###
  #
  coreutils
  gawk
  ripgrep
  ripgrep-all
  findutils
  fd
  broot
  ispell
  aspell
  aspellDicts.en
  exa
  lsd
  exiftool
  git-lfs
  wget
  w3m
  thefuck
  pet
  fasd
  jq
  fzf
  tealdeer
  most
  # xscreensaver

  ###
  ### Hacking
  ###
  #

  # Development utilities
  cookiecutter

  # Scala
  scala
  ammonite
  sbt-extras
  bloop
  metals

  # Nix
  nixfmt

  # Kubernetese
  minikube

  cmake

  # C/C++
  gcc

  # Web
  hugo

  ###
  ### Stuff
  ###
  xquartz
  fortune
  neo-cowsay
  ponysay
  tewisay

  ###
  ### emacs pdf-tools
  ###
  #
  stdenv
  pkgconfig
  autoconf
  automake
  libpng
  zlib
  poppler
  poppler_gi

  ###
  ### Fonts
  ###
  # NOTE The fonts are not installled on macOS if I include them here
  # NOTE Set the fonts in nix-darwin to make macOS install them
  # programming fonts
  # jetbrains-mono
  # fira-code
  # fira-code-symbols

  # # terminal fonts
  # nerdfonts
  # inconsolata-nerdfont
  # terminus-nerdfont

  ###
  ### Not Working on macOS
  ###
  #
  # calibre
  # dbeaver
]
