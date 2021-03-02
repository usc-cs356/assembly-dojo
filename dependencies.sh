# use this script to install the required dependencies on Debian/amd64

# NOTE: installing gcc-multilib allows compiling for x86-32 (gcc -m32)
# NOTE: gcc-multilib conflicts with gcc-aarch64-linux-gnu

# installs gcc and gcc-multilib
sudo apt-get install make gcc gcc-multilib gdb-multiarch qemu-user-static

# removes gcc-multilib but leaves its dependencies
sudo apt-get install gcc-aarch64-linux-gnu libc6-dev-arm64-cross

# needed without gcc-multilib
sudo ln -s /usr/include/asm-generic /usr/include/asm
