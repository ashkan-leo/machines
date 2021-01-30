{ pkgs }:

with pkgs; [
  ###
  ### Cloud
  ###
  #
  linode-cli

  ###
  ### Utilities
  ###
  #
  coreutils
  graphviz
  mosh
  tcl

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

  exiftool
  gitAndTools.gh
  gitAndTools.grv
  gitAndTools.gita
  gitAndTools.ghorg
  gitAndTools.git-open
  gitAndTools.gh
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
  fswatch

  # Jupyter
  python39Packages.jupyter
  python39Packages.jupyterlab
  python39Packages.jupyterlab-git
  python39Packages.jupyterlab_launcher
  python39Packages.jupyterlab-pygments
  python39Packages.jupyterlab-pygments


  # Scala
  scala
  ammonite
  sbt-extras
  # bloop
  metals

  # Nix
  nixops
  nixfmt
  nix-doc
  manix
  nix-prefetch-git
  nix-prefetch-github

  # Prolog
  swiProlog

  # Python
  python39Full
  pipenv
  poetry

  # Kubernetese
  minikube

  # C/C++
  gcc
  cmake

  # Web
  hugo

  # Haskell
  ghc
  cabal-install
  stack
  cabal2nix
  haskellPackages.hoogle

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
