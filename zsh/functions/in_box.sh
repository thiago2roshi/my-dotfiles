##
# function in_box
# author: giodamelio
# repo: https://github.com/giodamelio/dotfiles/blob/master/fish/.config/fish/functions/in_box.fish
# function in test
##
function in_box {
  function print_usage {
    echo "Usage: in_box [<title>] <command>"
  }

  # Default charset
  c_horizontal "━"
  c_vertical "┃"
  c_corner_up_left "┏"
  c_corner_up_right "┓"
  c_corner_down_left "┗"
  c_corner_down_right "┛"
  c_t_right "┣"
  c_t_left "┫"

  # Handle the parameters
  case (count $argv) in
    0)
      print_usage
      return 1
    ;;
    1)
      command_ $argv[1]
    ;;
    2)
      label $argv[1]
      command_ $argv[2]
    ;;
  esac


  # Get the output of the command,
  # if it fails, exit
  command_output (eval $command_)
  command_exit_code $status
  if test $command_exit_code -eq 127 {
    echo "Command \"$command_\" not found $command_exit_code"
    return $command_exit_code
  }
  
  # Print the beginning of the top of the box
  if label ; then
    label_beginning  "$c_corner_up_left$c_horizontal$c_horizontal$c_horizontal$c_t_left $label $c_t_right$c_horizontal$c_horizontal$c_horizontal"
    label_beginning_length (echo $label_beginning | wc -m)
    echo -n $label_beginning
  else
    label_beginning  "$c_corner_up_left$c_horizontal$c_horizontal$c_horizontal"
    label_beginning_length (echo $label_beginning | wc -m)
    echo -n $label_beginning
  fi

  # Find the longest line in the output
  max_length (echo -n {$command_output}\n |  wc -L)

  # Finish the top of the box
  for i in (seq 1 (math $max_length - $label_beginning_length + 4)){
    echo -n "$c_horizontal"
  }
  echo "$c_corner_up_right"

  # Print each line of the command with the left and right edges
  for line in $command_output{
    echo -n "$c_vertical $line "

    # Pad some spaces to match length of longest line
    line_length (echo "$c_vertical $line " | wc -m)
    pad_by (math $max_length - $line_length + 4)

    # If the longest line is shorter then the label width,
    # add extra padding to make it line up
    extra_pad 0
    if test $max_length -lt (math $label_beginning_length + 1)
      extra_pad (math $label_beginning_length - $max_length - 4)
    }

    for i in (seq 1 (math $pad_by + $extra_pad)){
      echo -n " "
    }

    # Add the right border
    echo "$c_vertical"
  }

  # Add buttom line
  echo -n "$c_corner_down_left"
  for i in (seq 1 (math $max_length + 2 + $extra_pad)){
    echo -n "$c_horizontal"
  }
  echo "$c_corner_down_right"
}
