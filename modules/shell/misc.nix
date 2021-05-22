{ config, lib, pkgs, ... }:

{
  programs.htop = {
    enable = true;
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
      left = [
        "LeftCPUs4"
        "Memory"
        "Blank"
        "Uptime"
      ];
      right = [
        "RightCPUs4"
        "Swap"
        "Blank"
        "LoadAverage"
      ];
    };
    sortKey = "PERCENT_CPU";
    sortDescending = true;
    hideKernelThreads = false;
    showProgramPath = false;
    highlightThreads = true;
    highlightMegabytes = true;
    treeView = false;
    cpuCountFromZero = true;
    showCpuFrequency = true;
    showCpuUsage = true;
    enableMouse = true;
    colorScheme = 5;
    vimMode = true;
    delay = 20;
  };

  # send notifications
  programs.noti.enable = true;

  # a better ls
  programs.lsd = {
    enable = true;
    enableAliases = true;
  };
}
