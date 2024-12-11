# Summit firmware for the LWB5+ SDIO/UART module

lwb5plus_sdio_sa_firmware:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call fbprint_d,$(repo_lwb5plus_sdio_sa_firmware_tar_url)) && \
	 mkdir -p $(FBOUTDIR)/bsp/lwb5plus_sdio_sa_firmware/lib && cd $(FBOUTDIR)/bsp/lwb5plus_sdio_sa_firmware/lib && \
	 echo Installing IF573 SDIO firmware && \
	 wget -q $(repo_lwb5plus_sdio_sa_firmware_tar_url) -O lwb5plus_sdio_sa_firmware.tar.gz && \
	 tar xf lwb5plus_sdio_sa_firmware.tar.gz --strip-components 1; \
	 $(call fbprint_d,"lwb5plus_sdio_sa_firmware")
