# Summit firmware for the IF573 SDIO/UART module

if573_sdio_firmware:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call fbprint_d,$(repo_if573_sdio_firmware_tar_url)) && \
	 mkdir -p $(FBOUTDIR)/bsp/if573_sdio_firmware/lib && cd $(FBOUTDIR)/bsp/if573_sdio_firmware/lib && \
	 echo Installing IF573 SDIO firmware && \
	 wget -q $(repo_if573_sdio_firmware_tar_url) -O if573_sdio_firmware.tar.gz && \
	 tar xf if573_sdio_firmware.tar.gz --strip-components 1; \
	 $(call fbprint_d,"if573_sdio_firmware")
