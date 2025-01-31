#!/bin/bash

source "etc/shell/vars.sh"

echo -en "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} TEST OK \c"
evaluate 'pwd'

echo -en "${LOGPREFIX}|${SECTION_PREFIX}|${YELLOW} TEST Fail \c"
evaluate 'eval cat /etc/*-release' 