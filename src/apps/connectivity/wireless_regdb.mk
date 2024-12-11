# Wireless Central Regulatory Domain Database
# Needed for kernel_module_bdsdmac_backports modules to load

wireless_regdb:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call fbprint_d,$(repo_wireless_regdb_tar_url)) && \
	 mkdir -p $(FBOUTDIR)/apps/connectivity/wireless_regdb && cd $(FBOUTDIR)/apps/connectivity/wireless_regdb && \
	 echo Installing Wireless Regdb && \
	 wget -q $(repo_wireless_regdb_tar_url) -O wireless_regdb.tar.gz && \
	 tar xf wireless_regdb.tar.gz --strip-components 1; \
	 $(call fbprint_d,"wireless_regdb")
