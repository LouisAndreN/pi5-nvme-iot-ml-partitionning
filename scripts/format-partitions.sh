NVME_DEVICE=$(detect_nvme_device)

# Formatage avec labels
sudo mkfs.vfat -F32 -n system-boot "/dev/${NVME_DEVICE}p1" | log_cmd "Boot partition"
sudo mkfs.ext4 -F -L writable "/dev/${NVME_DEVICE}p2" | log_cmd "Root partition"
sudo mkfs.ext4 -F "/dev/${NVME_DEVICE}p3" | log_cmd "/var partition"
sudo mkfs.ext4 -F -L CONTAINERS "/dev/${NVME_DEVICE}p4" | log_cmd "Containers partition"
sudo mkfs.ext4 -F -L ML-DATA "/dev/${NVME_DEVICE}p5" | log_cmd "ML-DATA partition"
sudo mkfs.xfs -f "/dev/${NVME_DEVICE}p6" | log_cmd "Scratch partition"
sudo mkfs.btrfs -f -L DATA "/dev/${NVME_DEVICE}p7" | log_cmd "Data partition"

sudo lsblk -f "/dev/${NVME_DEVICE}"
