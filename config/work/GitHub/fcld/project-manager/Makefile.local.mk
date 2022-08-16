soft-update-customdev: update-commons-api
	echo "$(LOGPREFIX) $(GREEN) Soft Update  | $(NC) Resetting, updating and executing migrations for TLM Backend ..."
	cd $(FCLD_TLM_BACKEND) && $(reset-branch) && make migrations
	echo "$(LOGPREFIX) $(GREEN) Soft Update  | $(NC) Resetting, updating and executing migrations for Twitter API ..."
	cd $(FCLD_TWITTER_API) && $(reset-branch) && make migrations
	echo "$(LOGPREFIX) $(GREEN) Soft Update  | $(NC) Resetting, updating and executing migrations for Fanactivator ..."
	cd $(FCLD_FANACTIVATOR) && $(reset-branch) && make migrations

start: start-local-infrastructure start-commons-api

stop: stop-commons-api stop-local-infrastructure