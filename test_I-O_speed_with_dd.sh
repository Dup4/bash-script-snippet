#! /bin/bash

# test disk write speed
dd if=/dev/zero of="${HOME}"/test bs=1M count=1024 oflag=dsync

# clear read cache
sudo /sbin/sysctl -w vm.drop_caches=3

# test disk read speed
dd if="${HOME}"/test of=/dev/null bs=1M count=1024

# test memory write speed
dd if=/dev/zero of=/dev/shm/test bs=1M count=1024 oflag=dsync

# test memory read speed
dd if=/dev/shm/test of=/dev/null bs=1M count=1024

# mount a tmpfs mountpoint
mount -t tmpfs -o size=512M tmpfs "${HOME}"/tmp

# check if a path is a mount point
mountpoint "${HOME}"/tmp

# unmount a mountpoint
umount -v "${HOME}"/tmp
