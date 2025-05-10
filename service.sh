#!/system/bin/sh

# Anti-detection service
while true; do
    # Hide from package manager
    pm disable com.android.vending.billing.InAppBillingService.COIN
    pm disable com.android.vending.billing.InAppBillingService.LUCK
    pm disable com.android.vending.billing.InAppBillingService.LIVE
    
    # Hide from process list
    mount --bind /dev/null /proc/self/maps
    mount --bind /dev/null /proc/self/status
    mount --bind /dev/null /proc/self/cmdline
    
    # Hide from file system
    mount --bind /dev/null /data/adb/lspd
    mount --bind /dev/null /data/adb/modules/lsposed
    mount --bind /dev/null /data/misc/lspd
    
    # Randomize module directory
    RANDOM_DIR="/data/adb/modules/$(cat /proc/sys/kernel/random/uuid)"
    if [ -d "$RANDOM_DIR" ]; then
        chmod 000 "$RANDOM_DIR"
        chown 0:0 "$RANDOM_DIR"
    fi
    
    # Clean up traces
    rm -rf /data/adb/lspd
    rm -rf /data/adb/modules/lsposed
    rm -rf /data/misc/lspd
    
    sleep 1
done 