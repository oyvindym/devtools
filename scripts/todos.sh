#!/bin/bash

# Colors: https://gist.github.com/skeptycal/4473a535729dbf8e7683532108d931b6
# Note: Replace \e with \033

WHITE=$(printf '\033[0;37m')
PURPLE_UNDERLINE=$(printf '\033[4;35m')
PURPLE_BOLD=$(printf '\033[1;35m')
LINK_START=$(printf '\033]8;;')
LINK_END=$(printf '\033]8;;')

grep -E 'TODO:' $(git ls-files -m --others --exclude-standard) \
	| sed -E "s/(.+\.[a-z]{2,3}).+(\/\/|{\/\*) TODO:(.*)$/${PURPLE_UNDERLINE}${PURPLE_BOLD}\1\n${WHITE}[ ]\3\n/g" \
	| sed -E "s/\*\/}$//g"
	 
	