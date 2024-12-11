# Kernel loadable module for Summit Backports for BD-SDMAC
# Supports the following modules: BD-SDMAC, IF573, LWB5+

kernel_module_bdsdmac_backports:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call fbprint_d,$(repo_kernel_module_bdsdmac_backports_tar_url)) && \
	     mkdir -p $(PKGDIR)/linux/kernel_module_bdsdmac_backports && cd $(PKGDIR)/linux/kernel_module_bdsdmac_backports && \
	     wget -q $(repo_kernel_module_bdsdmac_backports_tar_url) -O kernel_module_bdsdmac_backports.tar.gz && \
	     tar xf kernel_module_bdsdmac_backports.tar.gz --strip-components 1; \
	 $(call repo-mngr,fetch,$(KERNEL_TREE),linux) && \
	 \
	 if [ ! -d $(FBOUTDIR)/linux/linux/$(DESTARCH)/$(SOCFAMILY) ]; then \
	     bld linux -a $(DESTARCH) -p $(SOCFAMILY) -f $(CFGLISTYML); \
	 fi && \
	 bld linux-headers -r $(DISTROTYPE):$(DISTROVARIANT) -a $(DESTARCH) -f $(CFGLISTYML); \
	 curbrch=`cd $(KERNEL_PATH) && git branch | grep ^* | cut -d' ' -f2` && \
	 opdir=$(KERNEL_OUTPUT_PATH)/$$curbrch && \
	 \
	 cd $(PKGDIR)/linux/kernel_module_bdsdmac_backports && \
	 $(call fbprint_b,"kernel_module_bdsdmac_backports $(KERNEL_PATH)") && \
	 $(MAKE) KERNEL_SRC=$(KERNEL_PATH) KLIB_BUILD=$$opdir INSTALL_MOD_PATH=$$opdir/tmp defconfig-bdimx8  && \
	 $(MAKE) KERNEL_SRC=$(KERNEL_PATH) KLIB_BUILD=$$opdir INSTALL_MOD_PATH=$$opdir/tmp && \
	 $(MAKE) KERNEL_SRC=$(KERNEL_PATH) KLIB_BUILD=$$opdir INSTALL_MOD_PATH=$$opdir/tmp modules_install && \
	 $(call fbprint_d,"kernel_module_bdsdmac_backports")
