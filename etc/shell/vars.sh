PROJECT_NAME='ZSH Environment Setup'

UNAME="$(eval uname)"
UNAME_ARCH="$(eval uname -m)"
OS_RELEASE="$(eval cat /etc/*-release 2>/dev/null)" || OS_RELEASE="unknown"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m'
NL='\n'
UNDERLINE='\033[4m\033[1m'

OK=${GREEN}[OK]${NC}
ERROR=${RED}[ERROR]${NC}
INFO=${GREEN}[INFO]${NC}
WARNING=${ORANGE}[WARNING]${NC}

LOGPREFIX="${CYAN} ${PROJECT_NAME} "

HORIZONTAL_LINE='
=======================================================
'

ASCII_WELCOME='
 _       __     __                                     
| |     / /__  / /________  ____ ___  ___              
| | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \             
| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/             
|__/|__/\___/_/\___/\____/_/ /_/_/_/\___/          __  
  / ___/____  __  __/ / __ \/ __/ | / /___  ____  / /_ 
  \__ \/ __ \/ / / / / / / / /_/  |/ / __ \/ __ \/ __ \
 ___/ / /_/ / /_/ / / /_/ / __/ /|  / /_/ / /_/ / /_/ /
/____/\____/\__,_/_/\____/_/ /_/ |_/\____/\____/_.___/ 
                                                       
'
