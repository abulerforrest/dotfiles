#!/bin/bash

symlinkThese=("nvim" "starship" "neofetch")
DOT_PATH=~/dotfiles
CONFIG_PATH=~/.config
DELAY_SEC=1
COUNTER=0
TEXT_START="starting dotfiles symlinking jobs.."
TEXT_ALREADY="symlink seems to already be in place, nothing to do."

function file_exist() {
  if [ -d "$1" ] || [ -f "$1" ] || [ -L "$1" ] ; then
    echo 1
  else
    echo 0
  fi
}

function status_msg() {
  echo "[$1]: creating $1 $3 ($2) symlink"
}

function status_msg_not_found() {
  echo "[$1]: ($2) $3 not found, installed $1? skipped :("
}

cd $CONFIG_PATH

echo $TEXT_START

sleep $DELAY_SEC

for s in ${symlinkThese[@]}; do

  case $s in

    nvim)
      NVIM_EXIST="$(file_exist $CONFIG_PATH/$s)"
      if [ "$NVIM_EXIST" = 1 ]; then
        NVIM_IS_BACKED_UP="$(file_exist $CONFIG_PATH/${s}_old)"
        
        if [ "$NVIM_IS_BACKED_UP" = 0 ]; then
          mv $s ${s}_old
          echo "[$s]: renaming $s to ${s}_old"
        fi

        if [ "$(file_exist $CONFIG_PATH/${s})" = 0 ]; then
          echo "$(status_msg "$s" "$CONFIG_PATH/$s" "folder")"
          ln -s $DOT_PATH/$s $s
          COUNTER=$(( COUNTER + 1 ))
        else
          echo "[$s]: $TEXT_ALREADY"
        fi

      else
        echo "$(status_msg_not_found "$s" "$CONFIG_PATH/$s" "folder")"
      fi
      sleep $DELAY_SEC
      ;;
    neofetch)
      NEOFETCH_EXIST="$(file_exist $CONFIG_PATH/$s)"
      NEOFETCH_CONF_EXIST="$(file_exist $CONFIG_PATH/${s}/config.conf)"

      if [ "$NEOFETCH_CONF_EXIST" = 1 ]; then
        
        cd $s

        NEOFETCH_CONF_BAK_EXIST="$(file_exist $CONFIG_PATH/${s}/config_bak.conf)"
        
        if [ "$NEOFETCH_CONF_EXIST" = 1 ] && [ "$NEOFETCH_CONF_BAK_EXIST" = 0 ]; then
          mv config.conf config_bak.conf
          echo "[$s]: renaming config.conf to config_bak.conf"
        fi

        if [ "$(file_exist $CONFIG_PATH/${s}/config.conf)" = 0 ]; then
          echo "$(status_msg "$s" "$CONFIG_PATH/${s}/config.conf" "file")"
          ln -s "$DOT_PATH/${s}/config.conf" config.conf
          cd $CONFIG_PATH
          COUNTER=$(( COUNTER + 1 ))
        else
          echo "[$s]: $TEXT_ALREADY"
        fi
      else
        echo "$(status_msg_not_found "$s" "$CONFIG_PATH/${s}/config.conf" "file")"
      fi
      sleep $DELAY_SEC
      ;;
    starship)
      STARSHIP_EXIST="$(file_exist $CONFIG_PATH/${s}.toml)"
      if [ "$STARSHIP_EXIST" = 1 ]; then

        STARSHIP_IS_BACKED_UP="$(file_exist $CONFIG_PATH/${s}_bak.toml)"

        if [ "$STARSHIP_IS_BACKED_UP" = 0 ] && [ "$STARSHIP_EXIST" = 1 ]; then
          mv ${s}.toml ${s}_bak.toml
          echo "[$s]: renaming {$s}.toml to ${s}_bak.toml"
        fi

        if [ "$(file_exist $CONFIG_PATH/${s}.toml)" = 0 ]; then
         echo "$(status_msg "$s" "$CONFIG_PATH/${s}.toml" "file")"
         ln -s $DOT_PATH/${s}.toml $s.toml
         cd $CONFIG_PATH
         COUNTER=$(( COUNTER + 1 ))
        else
          echo "[$s]: symlink seems to already be in place, nothing to do."
        fi
      else
        echo "$(status_msg_not_found "$s" "$CONFIG_PATH/${s}.toml" "file")"
      fi
      sleep $DELAY_SEC
      ;;
    *)
      echo "all $COUNTER jobs are done."
    ;;
esac

done

    if [ $COUNTER == 0 ]; then
      echo "SORRY - added $COUNTER symlinks for your dotfiles repo."
    else
      echo "AMAZE - $COUNTER symlinks for your dotfiles repo added!"
    fi

