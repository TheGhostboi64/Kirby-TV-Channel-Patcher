#!/bin/ash 
#./KirbyTVChannelPatcher.sh 2>/dev/null
kirby_title="Kirby TV Channel Patcher (Unix/Linux Version) By Ghost64"

#print title
title () {
print "${kirby_title}======${1}"

#print subtitle
subtitle () {
	print "\055---${1}"
	printf "\055%.0s" $(seq 1 $(($(tput cols) - (${#1} + 4))))
	print "\n${2}\n"
	printf "\055%.0s" $(seq 1 $(tput cols))
	print "\n\n"
}

#get stuff from sketchmaster2001
sketchget () {
	curl --create-dirs -f -k -L -o "${2}" -S -s --insecure https://sketchmaster2001.github.io/kirby-tv/${1}
}

# Credits
credits () {
	clear

	title "Credits"
	print "Credits:\nGhost64 - Linux Version\nSketchMaster2001 - Original Version"
	
# Print with word wrap
print () {
	printf "${1}" | fold -s -w $(tput cols)
}

# Print string and wait for input to store in variable
input () {
	print "${1}"
	read -r ${2}
}


# Get file from RiiConnect24 website and save it to output
rc24get () {
	curl --create-dirs -f -k -L -o "${2}" -S -s --insecure https://patcher.rc24.xyz/update/RiiConnect24-Patcher/v1/${1}
}

case $(uname -m),$(uname) in
	x86_64,Darwin)
		sys="(macOS-x64)"
		mount=/Volumes
		;;
	arm64,Darwin)
		sys="(macOS-x64)"
		mount=/Volumes
		;;
	x86_64,*)
		sys="(linux-x64)"
		mount=/mnt
		;;
	aarch64,*)
		sys="(linux-arm64)"
		mount=/mnt
		;;
	*,*)
		sys="(linux-arm)"
		mount=/mnt
		;;
esac
	
if ! command -v curl >/dev/null 2>&1
then
	print "\"curl\" command not found! Please install the \"curl\" package using your package manager.\n\n"

	exit
fi
if ! command -v xdelta3 >/dev/null 2>&1
then
	case $(uname) in
		Darwin)
			print "xdelta3 command not found! \n Please install xdelta3 package using your package manager. \n\n"
			exit
			;;

	esac
fi


	rc24get apps/WiiModLite/boot.dol "${out_path}/apps/WiiModLite/boot.dol"
	rc24get apps/WiiModLite/icon.png "${out_path}/apps/WiiModLite/icon.png"
	rc24get apps/WiiModLite/meta.xml "${out_path}/apps/WiiModLite/meta.xml"
	out_path=ExtracttoWii/vWii
	case ${out_path} in
	ExtracttoWii/vWii)
		mkdir ExtracttoWii/vWii
		
	patch () {
	clear
	print "This will take a while, depending on your internet speed or your CPU."
	
		
# main menu
while true
do
	clear
subtitle "WARNING!"
"This is a early version of the script, so don't expect magic."
title "Main Menu"
print "\n1. Start\n   - Start patching.\n2. Credits \n3. Exit"
input "Choose an option (by typing its number and pressing return):" choice
case ${choice} in
		1.) patch;;
			
	    2.) credits;;
			
		3.) exit;;
		
		4.) language;;
			;;
