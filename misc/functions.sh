#!/bin/bash
function isup() {
	command -v fping > /dev/null 2>&1 && {
		fping -i 10 -r 0 -t 50 -gaAdq "$(ip route|tail -n1|cut -d' ' -f1)" | \
		awk '{gsub(/[()]/, "")} {printf "%-14s %s\n", $2, tolower($1)}';
	return 0; } || 
		echo "error: requires fping";
	return 1;
} 

function isip() {
	dig +short myip.opendns.com @resolver1.opendns.com;
	return 0;
} 

function sk() {
	[[ "$1" ]] && {
		find -iname "*$1*" 2> /dev/null; return 0; } || \
		echo -e "sk: nothing to search for\nusage: sk [SEARCHTERM]...";
	return 1;
}

function 256colors() {
	for line in {0..5}; do
		for col in {0..39}; do
				printf '\e[38;05;%dm %03d' $(( col * 6 + line + 16 )) $(( col * 6 + line + 16 ));
			done;
		echo;
	done;
	return 0;
}