#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="a10"
if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TARGET_ARCH=arm
	export TW_DEFAULT_LANGUAGE="en"
	export FOX_RECOVERY_INSTALL_PARTITION=/dev/block/platform/13500000.dwmmc0/by-name/recovery
	export FOX_RECOVERY_SYSTEM_PARTITION=/dev/block/platform/13500000.dwmmc0/by-name/system
        export OF_VANILLA_BUILD=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    	export OF_SKIP_ORANGEFOX_PROCESS=1
    	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
    	export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_USE_TWRP_SAR_DETECT=1
	export OF_FLASHLIGHT_ENABLE=0
	export OF_USE_GREEN_LED=0
	export OF_DEVICE_WITHOUT_PERSIST=1
	export OF_DISABLE_EXTRA_ABOUT_PAGE=1

	export FOX_REMOVE_AAPT=1
	export FOX_REMOVE_BASH=1
	export FOX_REMOVE_ZIP_BINARY=1
	export FOX_USE_BASH_SHELL=0
	export FOX_ASH_IS_BASH=0
	export FOX_USE_ZIP_BINARY=0
	export FOX_USE_NANO_EDITOR=0
	export FOX_USE_TAR_BINARY=0
	unset FOX_REPLACE_BUSYBOX_PS
	#export FOX_DRASTIC_SIZE_REDUCTION=1

        # -- add settings for R11 --
        #export FOX_ADVANCED_SECURITY=1
        export FOX_R11=1
        export OF_QUICK_BACKUP_LIST="/boot;/data;/vendor_image;/system_image;"
        # -- end R11 settings --

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	fi
	add_lunch_combo omni_"$FDEVICE"-eng
	add_lunch_combo omni_"$FDEVICE"-userdebug
fi
#
