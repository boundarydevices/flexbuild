# Kernel loadable module for Vivante GPU

kernel_module_imx_gpu_viv:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call repo-mngr,fetch,kernel_module_imx_gpu_viv,linux) && \
	 $(call repo-mngr,fetch,$(KERNEL_TREE),linux) && \
	 \
	 if [ ! -d $(FBOUTDIR)/linux/kernel/$(DESTARCH)/$(SOCFAMILY) ]; then \
	     bld linux -a $(DESTARCH) -p $(SOCFAMILY) -f $(CFGLISTYML); \
	 fi && \
	 curbrch=`cd $(KERNEL_PATH) && git branch | grep ^* | cut -d' ' -f2` && \
	 opdir=$(KERNEL_OUTPUT_PATH)/$$curbrch && mkdir -p $$opdir && \
	 aqroot=$(PKGDIR)/linux/kernel_module_imx_gpu_viv/kernel-module-imx-gpu-viv-src && \
	 \
	 cd $(PKGDIR)/linux/kernel_module_imx_gpu_viv && \
	 $(call fbprint_b,"kernel_module_imx_gpu_viv") && \
	 export INSTALL_MOD_PATH=$$opdir/tmp && \
	  $(call fbprint_b,"$(INSTALL_MOD_PATH) kernel_module_imx_gpu_viv") && \
	 make KERNEL_SRC=$(KERNEL_PATH) AQROOT=$$aqroot CONFIG_MXC_GPU_VIV=m O=$$opdir ENABLE_IRQ=yes && \
	 make KERNEL_SRC=$(KERNEL_PATH) AQROOT=$$aqroot CONFIG_MXC_GPU_VIV=m O=$$opdir ENABLE_IRQ=yes modules_install && \
	 $(call fbprint_d,"kernel_module_imx_gpu_viv")
