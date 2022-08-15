.DEFAULT_GOAL := default
.NOTPARALLEL:
.SILENT:

# include the default layout and all other tasks
include etc/make/includes/_all.mk

.PHONY: default init

default: deps init

# Extend default workflow
# ======================

deps:: 
	echo "$(LOGPREFIX) $(RED) Dependencies  |$(NC) Lorem Ipsum: $(UNAME)"

	

# ifeq ($(UNAME), Darwin)
# 	echo "$(LOGPREFIX) $(RED) Testing  |$(NC) Mac"
# endif

# ifeq ($(UNAME), Linux)
# 	echo
# 	echo "$(LOGPREFIX) $(RED) Testing  |$(NC) Linux"
# 	echo
# endif

init:: 
	echo "$(LOGPREFIX) $(RED) Init  |$(NC) Lorem Ipsum: $(UNAME)"
