## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/powermenu"
theme='style'

# CMDs
uptime="$(uptime | sed -e 's/up //g')"
host=$(hostname)
user=$(whoami)

# Options
shutdown=''
reboot=''
lock=''
suspend='󰤁'
logout='󰍃'
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$user@$host" \
		-mesg "$uptime" \
		-theme "${dir}/${theme}.rasi"
}

# Confirmation CMD
confirm_cmd() {
	rofi -dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme "${dir}/confirm.rasi"
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
      uwsm stop
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    "$shutdown")
		run_cmd --shutdown
        ;;
    "$reboot")
		run_cmd --reboot
        ;;
    "$lock")
    hyprlock
        ;;
    "$suspend")
		run_cmd --suspend
        ;;
    "$logout")
		run_cmd --logout
        ;;
esac
