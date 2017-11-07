################################################################################
#
# sunxi-mali-mainline
#
################################################################################

SUNXI_MALI_MAINLINE_VERSION = cb3e8ece9b2c3a70cbeb3204cd6f30eceaa32023
SUNXI_MALI_MAINLINE_SITE = $(call github,free-electrons,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles

ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2),y)
SUNXI_MALI_LIB_VER=r6p2
endif

define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/lib/lib_fb_dev/* \
		$(STAGING_DIR)/usr/lib/
	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/include/* \
		$(STAGING_DIR)/usr/include/

	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
endef

define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/lib/lib_fb_dev/* \
		$(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))
