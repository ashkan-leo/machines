{ pkgs }:

with pkgs; [
  ###
  ### Cloud
  ###
  #
  linode-cli
  awscli2
  terraform

  ###
  ### Utilities
  ###
  #
  coreutils
  graphviz
  mosh
  tcl
  lice
  arion
  pciutils

  # text search & manipulation programs
  gawk
  ack
  ripgrep
  ripgrep-all
  silver-searcher
  findutils
  fd
  # jsawk FIXME depends on spidermonkey which doesn't build under os x

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

  # git and friends
  # git-sync FIXME
  gitAndTools.gh
  # gitAndTools.grv
  gitAndTools.gita
  gitAndTools.ghorg
  gitAndTools.git-open
  gitAndTools.gh
  git-lfs
  subversion

  wget
  w3m
  thefuck
  pet
  fasd
  jq
  fzf
  openssl
  tealdeer
  most
  # xscreensaver

  ###
  ### Hacking
  ###
  #

  nodePackages.prettier
  cookiecutter
  fswatch
  watchman


  # Scala
  scala
  ammonite
  sbt-extras
  # bloop
  metals

  # Nix
  # nixops
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
  python39Packages.nose
  pipenv

  # Kubernetese
  # minikube

  # C/C++
  gcc
  lldb
  llvm
  cmake
  gnumake
  libtool
  # libgccjit FIXME

  # Rust
  rls
  nodePackages.coc-rls


  # Shell
  nodePackages.bash-language-server

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
