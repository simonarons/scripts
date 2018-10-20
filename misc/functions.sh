#!/bin/bash
sk() {
	[[ -n $1 ]] && {
		find -iname "*$1*" 2>/dev/null
		return 0
	} || {
		echo -e "${FUNCNAME[0]}: nothing to search for\nusage: ${FUNCNAME[0]} [pattern]"
		return 1
	}
}
