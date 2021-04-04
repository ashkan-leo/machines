{ pkgs }:

with pkgs; [
  ###
  ### Cloud
  ###
  #
  linode-cli
  awscli2

  ###
  ### Utilities
  ###
  #
  coreutils
  graphviz
  mosh
  tcl
  lice

  # text search & manipulation programs
  gawk
  jsawk
  ack
  ripgrep
  ripgrep-all
  silver-searcher
  findutils
  fd

  ###
  ### Natural Language
  ###
  #

  # spell checkers
  enchant
  aspell
  aspellDicts.de
  aspellDicts.en
  aspellDicts.en-science
  aspellDicts.en-computers
  hunspell
  hunspellDicts.en_US-large
  hunspellDicts.de_AT

  # proofreading
  languagetool

  # linter
  proselint

  ###
  ### markdown
  ###
  #
  mdl

  # file system tools
  exa
  lsd
  ranger
  sqlite
  exiftool
  git-sync
  gitAndTools.gh
  gitAndTools.grv
  gitAndTools.gita
  gitAndTools.ghorg
  gitAndTools.git-open
  gitAndTools.gh
  git-lfs
  wget
  w3m
  # thefuck FIXME
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

  nodePackages.prettier
  # Development utilities
  cookiecutter
  fswatch


  # Scala
  scala
  ammonite
  sbt-extras
  # bloop
  metals

  # Nix
  # nixops FIXME
  nixfmt
  nix-doc
  manix
  nix-prefetch-git
  nix-prefetch-github

  # Prolog
  # swiProlog FIXME

  # Python
  poetry
  nodePackages.pyright
  # python39Full
  # pipenv

  # Kubernetese
  # minikube

  # C/C++
  gcc
  # libgccjit FIXME
  cmake

  # Web
  hugo

  # Haskell
  # Comment out the dev tools and install them using nix-shell
  # ghc
  # cabal-install
  # stack
  # cabal2nix FIXME
  # haskellPackages.hoogle

  ###
  ### Type Setting
  ###
  texlive.combined.scheme-full
  pandoc

  ###
  ### Stuff
  ###
  fortune
  neo-cowsay
  ponysay
  tewisay

  ###
  ### emacs pdf-tools
  ###
  #

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
