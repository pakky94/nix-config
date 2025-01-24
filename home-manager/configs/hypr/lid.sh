#!/bin/sh

if [[ $1 == "open" ]]; then
  hyprctl keyword "\$LID_OPENED" true && hyprctl keyword device:a ""
  # echo "open" > ~/test1
else
  hyprctl keyword "\$LID_OPENED" false && hyprctl keyword device:a ""
  # echo "closed" > ~/test1
fi
