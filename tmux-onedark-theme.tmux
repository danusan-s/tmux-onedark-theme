#!/bin/bash
onedark_black="#15181B"         # Darker Black
onedark_blue="#61AFEF"          # Bright Blue
onedark_yellow="#D19A66"        # Bright Yellow
onedark_red="#E06C75"           # Bright Red
onedark_white="#ABB2BF"         # Bright White
onedark_green="#98C379"         # Bright Green
onedark_visual_grey="#3E4452"   # Retaining the existing visual grey
onedark_comment_grey="#5C6370"  # Bright Black (for comments)

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100""#[fg=$onedark_black,bg=#{?session_prefix,$onedark_red,$onedark_green},bold] #S #{prefix_highlight}#[fg=#{?session_prefix,$onedark_red,$onedark_green},bg=$onedark_black,nobold,nounderscore,noitalics]"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$onedark_white"
set "message-bg" "$onedark_black"

set "message-command-fg" "$onedark_white"
set "message-command-bg" "$onedark_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$onedark_black"
setw "window-status-bg" "$onedark_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$onedark_black"
setw "window-status-activity-fg" "$onedark_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$onedark_comment_grey"
set "window-active-style" "fg=$onedark_white"

set "pane-border-fg" "$onedark_white"
set "pane-border-bg" "$onedark_black"
set "pane-active-border-fg" "$onedark_green"
set "pane-active-border-bg" "$onedark_black"

set "display-panes-active-colour" "$onedark_yellow"
set "display-panes-colour" "$onedark_blue"

set "status-bg" "$onedark_black"
set "status-fg" "$onedark_white"

set "@prefix_highlight_fg" "$onedark_black"
set "@prefix_highlight_bg" "$onedark_green"
set "@prefix_highlight_copy_mode_attr" "fg=$onedark_black,bg=$onedark_green"
set "@prefix_highlight_output_prefix" "  "

time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$onedark_green,bg=$onedark_black]#[fg=$onedark_black,bg=$onedark_green] #{pane_current_path} #[fg=$onedark_yellow,bg=$onedark_green]#[fg=$onedark_black,bg=$onedark_yellow] ${time_format} #[fg=$onedark_red,bg=$onedark_yellow]#[fg=$onedark_black,bg=$onedark_red] ${date_format} "
set "status-left" "#[fg=$onedark_black,bg=#{?client_prefix,$onedark_red,$onedark_green},bold] #{?#{length:#S} > 20, #{prefix_highlight}#{slice:#S:0:20}..., #S} #[fg=#{?client_prefix,$onedark_red,$onedark_green},bg=$onedark_black,nobold,nounderscore,noitalics]"



set "window-status-format" "#[fg=$onedark_black,bg=$onedark_visual_grey,nobold,nounderscore,noitalics]#[fg=$onedark_white,bg=$onedark_visual_grey] #I  #W #[fg=$onedark_visual_grey,bg=$onedark_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$onedark_black,bg=$onedark_comment_grey,nobold,nounderscore,noitalics]#[fg=$onedark_white,bg=$onedark_comment_grey,nobold] #I  #W #[fg=$onedark_comment_grey,bg=$onedark_black,nobold,nounderscore,noitalics]"
