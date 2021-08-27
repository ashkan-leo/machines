{
  LC_ALL = "en_US.UTF-8";
  LANG = "en_US.UTF-8";
  LANGUAGE = "en_US.UTF-8";
  TERM = "xterm-256color";

  fish_key_bindings = "fish_vi_key_bindings";

  # BOBTHEFISH command prompt theme
  theme_color_scheme = "solarized-dark";
  theme_display_git_ahead_verbose = "no";
  theme_display_git_dirty_verbose = "no";
  theme_display_git_stashed_verbose = "no";
  theme_powerline_fonts = "yes";
  theme_nerd_fonts = "yes";
  theme_use_abbreviated_branch_name = "yes";

  VIRTUAL_ENV_DISABLE_PROMPT = "1";

  PAGER = "bat";
  MANPAGER = "bat";
  EDITOR = "emacsclient";

  # Setting fd as the default source for fzf
  FZF_DEFAULT_COMMAND = "fd --type f";
  # To apply the command to CTRL-T as well
  FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";

  # async_prompt_inherit_variables =
  #   "status CMD_DURATION theme_color_schema theme_display_git_ahead_verbose theme_display_git_dirty_verbose theme_display_git_stashed_verbose theme_powerline_fonts theme_nerd_fonts theme_use_abbreviated_branch_name";
}
