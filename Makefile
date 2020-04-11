# Copyright 2005 The Android Open Source Project
#
# Android.mk for adb
#

# adbd device daemon
# =========================================================

CC=arm-linux-gnueabi-gcc-5

LOCAL_SRC_FILES := \
	adb.c \
	fdevent.c \
	transport.c \
	transport_local.c \
	transport_usb.c \
	sockets.c \
	services.c \
	file_sync_service.c \
	framebuffer_service.c \
	remount_service.c \
	usb_linux_client.c \
	android_hacks.c \
	libcutils/socket_local_server.c \
	libcutils/socket_local_client.c \
	libcutils/socket_inaddr_any_server.c \
	libcutils/socket_loopback_server.c \
	libcutils/socket_loopback_client.c

	# adb_auth_client.c

LOCAL_CFLAGS := -O2 -g -DADB_HOST=0 -Wall -Wno-unused-parameter -Werror
LOCAL_CFLAGS += -D_XOPEN_SOURCE -D_GNU_SOURCE
LOCAL_CFLAGS += -DHAVE_SYMLINKS -DXX_AUTH=0

LOCAL_MODULE := adbd

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT_SBIN)
LOCAL_UNSTRIPPED_PATH := $(TARGET_ROOT_OUT_SBIN_UNSTRIPPED)

LOCAL_STATIC_LIBRARIES := liblog libcutils libc libmincrypt


$(LOCAL_MODULE): $(LOCAL_SRC_FILES)
	$(CC) -o $@ $^ $(LOCAL_CFLAGS) -static -s -Iinclude -lpthread


# adb host tool for device-as-host
# =========================================================
# LOCAL_SRC_FILES := \
# 	adb.c \
# 	console.c \
# 	transport.c \
# 	transport_local.c \
# 	transport_usb.c \
# 	commandline.c \
# 	adb_client.c \
# 	adb_auth_host.c \
# 	sockets.c \
# 	services.c \
# 	file_sync_client.c \
# 	get_my_path_linux.c \
# 	usb_linux.c \
# 	usb_vendors.c \
# 	fdevent.c

# LOCAL_CFLAGS := \
# 	-O2 \
# 	-g \
# 	-DADB_HOST=1 \
# 	-DADB_HOST_ON_TARGET=1 \
# 	-Wall -Wno-unused-parameter -Werror \
# 	-D_XOPEN_SOURCE \
# 	-D_GNU_SOURCE

# LOCAL_C_INCLUDES += external/openssl/include

# LOCAL_MODULE := adb

# LOCAL_STATIC_LIBRARIES := libzipfile libunz libcutils liblog

# LOCAL_SHARED_LIBRARIES := libcrypto