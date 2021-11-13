{ config, lib, pkgs, ... }: { imports = [ ../../mac ]; homebrew.brewPrefix = "/opt/homebrew/bin"; }
