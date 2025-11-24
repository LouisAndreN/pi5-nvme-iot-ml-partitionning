SD_BOOT=$(mount | grep "/boot/firmware" | awk '{print $3}' | head -1)
if [ -z "$SD_BOOT" ]; then
    SD_BOOT=$(mount | grep "system-boot" | awk '{print $3}' | head -1)
fi
SD_ROOT=$(mount | grep "writable" | awk '{print $3}' | head -1)
if [ -z "$SD_ROOT" ]; then
    # Chercher une partition ext4 qui ressemble à root Ubuntu
    for mount_point in /media/$USER/writable /media/$USER/rootfs /mnt/*; do
        if [ -d "$mount_point/etc" ] && [ -d "$mount_point/usr" ]; then
            SD_ROOT="$mount_point"
            break
        fi
    done
fi

if [ -z "$SD_BOOT" ] || [ -z "$SD_ROOT" ]; then
    echo "Impossible de trouver les partitions SD"
    echo "Montages actuels:"
    mount | grep -E "(boot|writable|system-boot)"
    exit 1
fi
