NVME_DEVICE=$(sudo lsblk -d -o NAME,TYPE | grep nvme | awk '{print $1}' | head -1)
NVME_PATH="/dev/${NVME_DEVICE}"

parted -s "${NVME_PATH}" -- \
    mklabel gpt \
    mkpart primary fat32 1MiB 1025MiB \
    mkpart primary ext4 1025MiB 101GiB \
    mkpart primary ext4 101GiB 241GiB \
    mkpart primary ext4 241GiB 421GiB \
    mkpart primary ext4 421GiB 651GiB \
    mkpart primary xfs 651GiB 711GiB \
    mkpart primary btrfs 711GiB 100% \
    set 1 boot on \
    set 1 esp on

partprobe "${NVME_PATH}"
