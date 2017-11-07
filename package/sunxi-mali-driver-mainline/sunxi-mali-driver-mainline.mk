################################################################################
#
# sunxi-mali-driver-mainline
#
################################################################################

SUNXI_MALI_DRIVER_MAINLINE_VERSION = c46db81935b7829298eeb1a7614db0bbcf7f7f63
SUNXI_MALI_DRIVER_MAINLINE_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_DRIVER_MAINLINE_VERSION))
SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux

SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
	KDIR=$(LINUX_DIR) \
	CROSS_COMPILE=$(TARGET_CROSS) \
	INSTALL_MOD_PATH=$(TARGET_DIR)

ifeq ($(BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE_R6P2),y)
SUNXI_MALI_DRIVER_VER=r6p2
endif

define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
	cd $(@D) && $(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
		$(SHELL) ./build.sh -r $(SUNXI_MALI_DRIVER_VER) -b
endef

define SUNXI_MALI_DRIVER_MAINLINE_INSTALL_TARGET_CMDS
	cd $(@D) && $(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
		$(SHELL) ./build.sh -r $(SUNXI_MALI_DRIVER_VER) -i
endef

$(eval $(generic-package))
