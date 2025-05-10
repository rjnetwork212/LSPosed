#!/system/bin/sh

# Hide module files
MODDIR=${0%/*}
MODID=${MODDIR##*/}
MAGISKTMP="$(magisk --path)/.magisk/modules/$MODID"

# Randomize module directory name
RANDOM_DIR="/data/adb/modules/$(cat /proc/sys/kernel/random/uuid)"
mkdir -p "$RANDOM_DIR"
cp -r "$MODDIR"/* "$RANDOM_DIR"/

# Hide LSPosed related files
mount --bind /dev/null /data/adb/lspd
mount --bind /dev/null /data/adb/modules/lsposed
mount --bind /dev/null /data/misc/lspd

# Hide Xposed related files
mount --bind /dev/null /data/adb/xposed
mount --bind /dev/null /data/adb/modules/xposed

# Hide module files from package manager
mount --bind /dev/null /data/system/package_cache
mount --bind /dev/null /data/system/users/0/package-restrictions.xml

# Clean up traces
rm -rf /data/adb/lspd
rm -rf /data/adb/modules/lsposed
rm -rf /data/misc/lspd
rm -rf /data/adb/xposed
rm -rf /data/adb/modules/xposed

# Set random permissions
chmod 000 "$RANDOM_DIR"
chown 0:0 "$RANDOM_DIR"

# Hide from process list
mount --bind /dev/null /proc/self/maps
mount --bind /dev/null /proc/self/status
mount --bind /dev/null /proc/self/cmdline

exit 0 