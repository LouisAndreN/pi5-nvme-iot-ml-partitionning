detect_nvme_device() {
    sudo lsblk -d -o NAME,TYPE | grep nvme | awk '{print $1}' | head -1
}

save_uuids() {
    local nvme_dev=$1
    mkdir -p ~/nvme-setup
    
    cat > ~/nvme-setup/uuids.sh <<EOF
export BOOT_UUID=$(blkid -s UUID -o value "/dev/${nvme_dev}p1")
export ROOT_UUID=$(blkid -s UUID -o value "/dev/${nvme_dev}p2")
export VAR_UUID=$(blkid -s UUID -o value "/dev/${nvme_dev}p3")
export CONTAINERS_UUID=$(blkid -s UUID -o value "/dev/${nvme_dev}p4")
export ML_DATA_UUID=$(blkid -s UUID -o value "/dev/${nvme_dev}p5")
export SCRATCH_UUID=$(blkid -s UUID -o value "/dev/${nvme_dev}p6")
export DATA_UUID=$(blkid -s UUID -t TYPE=btrfs -o value "/dev/${nvme_dev}p7")
EOF
    
    source ~/nvme-setup/uuids.sh
}
