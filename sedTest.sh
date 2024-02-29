#!/bin/sh

#mv asdf.txt.bak asdf.txt
#sed -i".bak" -e "s@.*http.*mipsel_24kc/onion.*@@g" asdf.txt

# if ! command -v zsh &> /dev/null
# then
#     echo "zsh could not be found"
#     exit 1
# else 
#     echo "zsh exists"
#     exit 1
# fi

command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }

type zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }

hash zsh 2>/dev/null || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
