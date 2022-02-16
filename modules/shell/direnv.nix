{ config, lib, pkgs, ... }:

{
  programs.direnv = {
    enable = true;

    # TODO check out direnv nix integration
    # https://github.com/nix-community/nix-direnv
    nix-direnv.enable = true;

    # enable python-venv builtin support in direnv
    stdlib = ''
      realpath() {
          [[ $1 = /* ]] && echo "$1" || echo "$PWD/''${1#./}"
      }
      layout_python-venv() {
          local python=''${1:-python3}
          [[ $# -gt 0 ]] && shift
          unset PYTHONHOME
          if [[ -n $VIRTUAL_ENV ]]; then
              VIRTUAL_ENV=$(realpath "''${VIRTUAL_ENV}")
          else
              local python_version
              python_version=$("$python" -c "import platform; print(platform.python_version())")
              if [[ -z $python_version ]]; then
                  log_error "Could not detect Python version"
                  return 1
              fi
              VIRTUAL_ENV=$PWD/.direnv/python-venv-$python_version
          fi
          export VIRTUAL_ENV
          if [[ ! -d $VIRTUAL_ENV ]]; then
              log_status "no venv found; creating $VIRTUAL_ENV"
              "$python" -m venv "$VIRTUAL_ENV"
          fi

          PATH="''${VIRTUAL_ENV}/bin:''${PATH}"
          export PATH
      }
      layout_poetry() {
        if [[ ! -f pyproject.toml ]]; then
          log_error 'No pyproject.toml found.  Use `poetry new` or `poetry init` to create one first.'
          exit 2
        fi

        local VENV=$(dirname $(poetry run which python))
        export VIRTUAL_ENV=$(echo "$VENV" | rev | cut -d'/' -f2- | rev)
        export POETRY_ACTIVE=1
        PATH_add "$VENV"
      }
    '';
  };

  # Enable fish integration for direnv
  # NOTE: It seems this should happen automatically. But it doesn't...
  programs.fish.shellInit = lib.mkAfter ''
    eval (direnv hook fish)
  '';
}
