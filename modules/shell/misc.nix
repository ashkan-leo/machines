{ config, lib, pkgs, ... }:

{
  programs.htop = {
    enable = true;

    settings = {
      color_scheme = 5;
      cpu_count_from_zero = true;
      vimMode = true;
      delay = 20;
      sort_key = "PERCENT_CPU";
      sort_descending = true;
      hide_kernel_threads = false;
      show_program_path = false;
      highlight_threads = true;
      highlight_megabytes = true;
      tree_view = false;
      show_cpu_frequency = true;
      show_cpu_usage = true;
      enable_mouse = true;
    };
    fields = [
      "PID"
      "USER"
      "PRIORITY"
      "M_RESIDENT"
      "M_SIZE"
      "PERCENT_CPU"
      "PERCENT_MEM"
      "TIME"
      "COMM"
    ];
    meters = {
      left = [ "LeftCPUs4" "Memory" "Blank" "Uptime" ];
      right = [ "RightCPUs4" "Swap" "Blank" "LoadAverage" ];
    };
  };

  # send notifications
  programs.noti.enable = true;

  # a better ls
  programs.lsd = {
    enable = true;
    enableAliases = true;
  };
}
