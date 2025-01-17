#!/bin/bash

# Fail on error
set -exo pipefail

# Print each command
set -o xtrace

# Build the system image in Docker
docker buildx build --platform linux/arm64 --tag lotus --load --progress plain .

# docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY

# Build the base image
# docker buildx build --tag $CI_REGISTRY_IMAGE/megadrive --platform linux/arm64 --load --cache-from $CI_REGISTRY_IMAGE/megadrive:cache --cache-to $CI_REGISTRY_IMAGE/megadrive:cache --progress plain .


# EXTRACT IMAGE
# Make a temporary directory
mkdir .tmp/

# remove anything in the way of extraction
# docker run --rm --tty --volume $(pwd)/./.tmp:/root/./.tmp --workdir /root/./.tmp/.. faddat/toolbox rm -rf ./.tmp/result-rootfs

# save the image to result-rootfs.tar
docker save --output ./.tmp/result-rootfs.tar lotus

# Extract the image using docker-extract
docker run --rm --tty --volume $(pwd)/./.tmp:/root/./.tmp --workdir /root/./.tmp/.. faddat/toolbox /tools/docker-extract --root ./.tmp/result-rootfs  ./.tmp/result-rootfs.tar

# New rootfs extraction
# https://chromium.googlesource.com/external/github.com/docker/containerd/+/refs/tags/v0.2.0/docs/bundle.md
# create the container with a temp name so that we can export it
# docker create --name tempmegadrive $CI_REGISTRY_IMAGE/megadrive /bin/bash

# export it into the rootfs directory
# docker export tempmegadrive | tar -C ./.tmp/result-rootfs -xf -

# remove the container now that we have exported
# docker rm tempmegadrive


# ===================================================================================
# IMAGE: Make a .img file and compress it.
# Uses Techniques from Disconnected Systems:
# https://disconnected.systems/blog/raspberry-pi-archlinuxarm-setup/
# ===================================================================================


# Unmount anything on the loop device
sudo umount /dev/loop0p2 || true
sudo umount /dev/loop0p1 || true


# Detach from the loop device
sudo losetup -d /dev/loop0 || true

# Unmount anything on the loop device
sudo umount /dev/loop0p2 || true
sudo umount /dev/loop0p1 || true


# Create a folder for images
rm -rf images || true
mkdir -p images

# Make the image file
fallocate -l 4G "images/lotus.img"

# loop-mount the image file so it becomes a disk
export LOOP=$(sudo losetup --find --show images/lotus.img)

# partition the loop-mounted disk
sudo parted --script $LOOP mklabel msdos
sudo parted --script $LOOP mkpart primary fat32 0% 200M
sudo parted --script $LOOP mkpart primary ext4 200M 100%

# format the newly partitioned loop-mounted disk
sudo mkfs.vfat -F32 $(echo $LOOP)p1
sudo mkfs.ext4 -F $(echo $LOOP)p2

# Use the toolbox to copy the rootfs into the filesystem we formatted above.
# * mount the disk's /boot and / partitions
# * use rsync to copy files into the filesystem
# make a folder so we can mount the boot partition
# soon will not use toolbox

sudo mkdir -p mnt/boot mnt/rootfs
sudo mount $(echo $LOOP)p1 mnt/boot
sudo mount $(echo $LOOP)p2 mnt/rootfs
sudo rsync -a ./.tmp/result-rootfs/boot/* mnt/boot
sudo rsync -a ./.tmp/result-rootfs/* mnt/rootfs --exclude boot
sudo mkdir mnt/rootfs/boot

# ONLY NEEDED WHEN CI IS BARE METAL
# chill for a moment before unmounting
# sleep 20
# sudo umount mnt/boot mnt/rootfs
# sleep 20
# sudo losetup -d $LOOP # drop the loop mount


