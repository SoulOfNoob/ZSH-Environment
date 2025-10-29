#!/bin/bash

source "etc/shell/common.sh"

echo -e "TEST Success | $RED\c"
evaluate pwd

echo -e "Test Failure | $RED\c"
evaluate pwnd
