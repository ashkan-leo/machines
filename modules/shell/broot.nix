{ config, lib, pkgs, ... }:

{

  programs.broot = {
    enable = false;

    # https://dystroy.org/broot/skins/
    settings.skin = {
      # NOTE Solarized-dark
      default =
        "rgb(131, 148, 150) rgb(0, 43, 54) / rgb(131, 148, 150) rgb(7, 54, 66)";
      tree = "rgb(88, 110, 117) none";
      file = "none none";
      directory = "rgb(38, 139, 210) none bold";
      exe = "rgb(211, 1, 2) none";
      link = "rgb(211, 54, 130) none";
      pruning = "rgb(88, 110, 117) none italic";
      perm__ = "rgb(88, 110, 117) none";
      perm_r = "none none";
      perm_w = "none none";
      perm_x = "none none";
      owner = "rgb(88, 110, 117) none";
      group = "rgb(88, 110, 117) none";
      sparse = "none none";
      git_branch = "rgb(147, 161, 161) none";
      git_insertions = "rgb(133, 153, 0) none";
      git_deletions = "rgb(211, 1, 2) none";
      git_status_current = "none none";
      git_status_modified = "rgb(181, 137, 0) none";
      git_status_new = "rgb(133, 153, 0) none";
      git_status_ignored = "rgb(88, 110, 117) none";
      git_status_conflicted = "rgb(211, 1, 2) none";
      git_status_other = "rgb(211, 1, 2) none";
      selected_line = "none rgb(7, 54, 66)";
      char_match = "rgb(133, 153, 0) none underlined";
      file_error = "rgb(203, 75, 22) none italic";
      flag_label = "none none";
      flag_value = "rgb(181, 137, 0) none bold";
      input = "none none";
      status_error = "rgb(203, 75, 22) rgb(7, 54, 66)";
      status_job = "rgb(108, 113, 196) rgb(7, 54, 66) bold";
      status_normal = "none rgb(7, 54, 66)";
      status_italic = "rgb(181, 137, 0) rgb(7, 54, 66)";
      status_bold = "rgb(147, 161, 161) rgb(7, 54, 66) bold";
      status_code = "rgb(108, 113, 196) rgb(7, 54, 66)";
      status_ellipsis = "none rgb(7, 54, 66)";
      scrollbar_track = "rgb(7, 54, 66) none";
      scrollbar_thumb = "none none";
      help_paragraph = "none none";
      help_bold = "rgb(147, 161, 161) none bold";
      help_italic = "rgb(147, 161, 161) none italic";
      help_code = "rgb(147, 161, 161) rgb(7, 54, 66)";
      help_headers = "rgb(181, 137, 0) none";
      help_table_border = "none none";
    };
  };
}
