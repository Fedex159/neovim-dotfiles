# Variables
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"
WINDOWRULES_CONF="$HOME/dotfiles/.config/hypr/conf/windowrules/default.conf"
AUTOSTART_CONF="$HOME/dotfiles/.config/hypr/conf/autostart.conf"
WAYBAR_MODULES="$HOME/dotfiles/.config/waybar/modules.json"
WLOGOUT_CONF="$HOME/dotfiles/.config/wlogout/style.css"
HYPRIDLE_CONF="$HOME/dotfiles/.config/hypr/hypridle.conf"

# Custom Date format
# L%H:%M %a %Od
# America/Argentina/Buenos_Aires

# Restore hyprlock config
sed -i "s/\"\$TIME\"/\"\$(date +'%k:%M %p')\"/g" $HYPRLOCK_CONF

if grep -qF "\$(date +'%k:%M %p')" $HYPRLOCK_CONF; then
  echo "Hyprlock config restored successfully"
else
  echo "Hyprlock config restore failed"
fi

# Window rules
sed -i "s/Picture-in-Picture/Picture-in-picture/g" $WINDOWRULES_CONF

if grep -qF "Picture-in-picture" $WINDOWRULES_CONF; then
  echo "Window rules restored successfully"
else
  echo "Window rules restore failed"
fi

if grep -qF "#Neovim" $WINDOWRULES_CONF; then
  echo "Neovim rule already exists"
else
  echo -e "\n#Neovim" >>$WINDOWRULES_CONF
  echo "windowrulev2 = opacity 0.95,title:(.*)(nvim)$" >>$WINDOWRULES_CONF
  echo "windowrulev2 = nofocus, title:^(win1)$" >>$WINDOWRULES_CONF
  echo "windowrulev2 = nofocus, title:^(win2)$" >>$WINDOWRULES_CONF
  echo "Neovim rule added"
fi

if grep -qF "#Sweet Home" $WINDOWRULES_CONF; then
  echo "Sweet Home rules already exists"
else
  echo -e "\n#Sweet Home" >>$WINDOWRULES_CONF
  echo "windowrulev2 = nofocus, title:^(win1)$" >>$WINDOWRULES_CONF
  echo "windowrulev2 = nofocus, title:^(win2)$" >>$WINDOWRULES_CONF
  echo "Sweet Home rules added"
fi

# Auto start
if grep -qF "#Custom start" $AUTOSTART_CONF; then
  echo "Custom start rule already exists"
else
  echo "#Custom start" >>$AUTOSTART_CONF
  echo "exec = ~/.config/hypr/scripts/hyprshade.sh" >>$AUTOSTART_CONF
  echo "Custom start rule added"
fi

# Network waybar
if grep -qF "  {bandwidthUpBits}  {bandwidthDownBits}" $WAYBAR_MODULES; then
  echo "Network waybar already restored"
else
  sed -i 's/"format-ethernet": "  {ifname}"/"format-ethernet": "  {bandwidthUpBits}  {bandwidthDownBits}"/g' $WAYBAR_MODULES
  sed -i 's/"network": {/"network": {\n\t\t"interval": 1,/g' $WAYBAR_MODULES
  sed -i 's/"timezone": ".*"/"timezone": "America\/Argentina\/Buenos_Aires"/g' $WAYBAR_MODULES
  echo "Network waybar restore successfully"
fi

# Wlogout
if grep -qF "/* box-shadow: 0 0 50px @color7 */" $WLOGOUT_CONF; then
  echo "Wlogout already restored"
else
  sed -i 's/box-shadow: 0 0 50px @color7/\/\* box-shadow: 0 0 50px @color7 \*\//g' $WLOGOUT_CONF
  echo "Wlogout restore successfully"
fi

# Restore hypridle config
sed -i "s/pidof hyprlock || hyprlock/pidof gtklock || gtklock -d/g" $HYPRIDLE_CONF

if grep -qF "gtklock -d" $HYPRIDLE_CONF; then
  echo "Hypridle config restored successfully"
else
  echo "Hypridle config restore failed"
fi
