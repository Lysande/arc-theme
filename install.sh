if [ -d "/app" ]; then
  echo "This script must be run outside of nanobox, in order to access the real file system"
  exit -1
fi


dir="$PWD/build/share/themes/";

function copy_theme {
  theme_name=$1
  theme=$dir$theme_name

  echo -e "Preparing to copy theme: \e[1m$theme_name\e[0m"

  if [ ! -d $theme ]; then
    echo "No such theme"
    exit -1
  fi

  echo -en "Removing old copy ...\r"
  rm -rf ~/.themes/$theme_name
  echo -e "Removing old copy: \e[1;32mOk!\e[0m"

  echo -en "Copying folder ...\r"
  cp -r $theme ~/.themes

  echo -e "Copying folder: \e[1;32mOk!\e[0m"
}

copy_theme Quarc
copy_theme Quarc-Dark
copy_theme Quarc-Darker
