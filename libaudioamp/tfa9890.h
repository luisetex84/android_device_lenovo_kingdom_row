/*
 * Copyright (C) 2014, The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Kernel header */
#include <sound/tfa98xx.h>

#define TFA9890_DEVICE "/dev/tfa9890"

/* All the files in /system/etc/tfa98xx */
#define PATCH_DSP_FILE "/system/etc/tfa98xx/TFA9890_N1C3_1_7_1.patch"
#define PATCH_COLDBOOT_FILE "/system/etc/tfa98xx/coldboot.patch"

#define CONFIG_TFA9890 "/system/etc/tfa98xx/TFA9890_N1B12_N1C3_v2.config"

#define SPEAKER_LENOVO "/system/etc/tfa98xx/Lenovo.speaker"

#define PRESET_LENOVO_HQ "/system/etc/tfa98xx/Lenovo_HQ.preset"
#define PRESET_LENOVO_LOUD "/system/etc/tfa98xx/Lenovo_LOUD.preset"
#define PRESET_LENOVO_LOUD_BT "/system/etc/tfa98xx/Lenovo_LOUD_BT.preset"

#define EQ_LENOVO_HQ "/system/etc/tfa98xx/Lenovo_HQ.eq"
#define EQ_LENOVO_LOUD "/system/etc/tfa98xx/Lenovo_LOUD.eq"
#define EQ_LENOVO_LOUD_BT "/system/etc/tfa98xx/Lenovo_LOUD_BT.eq"

/* Macros for ioctl with above files
 * This macro calls tfa9890_prepare_for_ioctl()
 * to setup the ioctl arg,
 * and then calls ioctl() */
#define TFA9890_IOCTL(ioctltype, filename, filetype) \
	ret = tfa9890_prepare_for_ioctl(filename, filetype); \
	if (ret > 0) { \
		ALOGV("ioctl %s", filename); \
		ret = ioctl(fd, ioctltype, &tfa9890_param_data); \
		if (ret == -1) { \
			ALOGE("ioctl failed for %s with %d", filename, errno); \
			goto error; \
		} \
	} else \
		goto error; \

/* Macro for only ".eq"/EQ_ files
 * Same as above but calls a different function
 * to setup the ioctl arg */
#define TFA9890_IOCTL_EQ(filename, filetype) \
	ret = tfa9890_prepare_for_ioctl_eq(filename, filetype); \
	if (!ret) { \
		ALOGV("ioctl %s", filename); \
		ret = ioctl(fd, TFA98XX_EQ_PARAM, &tfa9890_param_data); \
		if (ret == -1) { \
			ret = errno; \
			ALOGE("ioctl failed for %s with %d", filename, ret); \
			goto error; \
		} \
	} else \
		goto error; \

int tfa9890_prepare_for_ioctl(const char*, unsigned int);
int tfa9890_prepare_for_ioctl_eq(const char*, unsigned int);
int tfa9890_init(void);
