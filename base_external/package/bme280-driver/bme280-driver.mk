
##############################################################
#
# BME280-ASSIGNMENTS
#
##############################################################

BME280_DRIVER_VERSION = 'ae3b008deaaf056a14d5e3aa44a07dd51c798217'
BME280_DRIVER_SITE = 'git@github.com:cu-ecen-aeld/final-project-thra6614.git'
BME280_DRIVER_SITE_METHOD = git
BME280_DRIVER_GIT_SUBMODULES = YES

BME280_DRIVER_MODULE_SUBDIRS = bme280-driver

define BME280_DRIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/measure all
endef


define BME280_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/measure/bme280_measure $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/bme280-driver/bme280_load $(TARGET_DIR)/usr/bin
    	$(INSTALL) -m 0755 $(@D)/bme280-driver/bme280_unload $(TARGET_DIR)/usr/bin
endef


$(eval $(kernel-module))
$(eval $(generic-package))

