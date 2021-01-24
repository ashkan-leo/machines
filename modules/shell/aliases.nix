{
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";

  "iw" = "cd '/Users/ashkanaleali/Library/Mobile Documents/com~apple~CloudDocs/Workspace'";
  "ir" = "cd '/Users/ashkanaleali/Library/Mobile Documents/com~apple~CloudDocs/Workspace/REPO'";

  # abbreviations
  h = "home-manager";
  n = "nix-env";
  dar = "darwin-rebuild";
  dao = "darwin-option";
  g = "git";
  rr = "ranger";
  fdd = "fd -d 1";
  fd1 = "fd -d 1";
  fd2 = "fd -d 2";
  fd3 = "fd -d 3";

  tx = "tmuxinator";
  ec = "emacsclient -c";

  # force python 3 everywhere
  python = "python3";
  pip = "pip3";

  # ssh = "TERM=xterm-256color ssh";

  # create a default tmux session and connect to it
  tt =
    "tmux attach-session -t H || tmux new-session -t H && tmux attach-session -t H";

  # upgrade nix, brew, emacs packages, and tldr
  upgrade =
    "sudo nix-channel --update; sudo home-manager switch; sudo darwin-rebuild switch; sudo brew upgrade; doom up; tldr --update";

  # cleanup the cache directories
  cleanup =
    "brew cleanup; rm -rf $HOME/Library/Caches/pip; rm -rf $HOME/Library/Caches/pipenv; rm -rf $HOME/Library/Caches/IntellijIdea*; rm -rf $HOME/Library/Caches/Yarn; rm -rf $HOME/Library/Caches/PyCharm*; rm -rf $HOME/Library/Caches/; rm -rf $HOME/Library/Caches/Popcorn-Time;";
}
