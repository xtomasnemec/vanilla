cd
apt update && apt upgrade -y
apt update -y
apt remove -y --purge ffmpeg libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavdevice-dev libavfilter-dev libpostproc-dev
apt autoremove -y
apt update
apt install -y build-essential pkg-config autoconf automake libtool yasm nasm git libssl-dev libgnutls28-dev libaom-dev libass-dev libbluray-dev libbs2b-dev libcaca-dev libcdio-dev libcodec2-dev libdav1d-dev libdc1394-22-dev libdrm-dev libflite-dev libfontconfig-dev libfreetype-dev libfribidi-dev libglslang-dev libgme-dev libgsm1-dev libharfbuzz-dev libiec61883-dev libjack-jackd2-dev libjxl-dev libmp3lame-dev libmysofa-dev libopenal-dev libopenjpeg-dev libopenmpt-dev libopus-dev libpulse-dev librabbitmq-dev librsvg2-dev librist-dev librubberband-dev libsdl2-dev libshine-dev libsnappy-dev libsoxr-dev libspeex-dev libsrt-dev libssh-dev libsvtav1-dev libtheora-dev libtwolame-dev libvidstab-dev libvorbis-dev libvpx-dev libwebp-dev libx264-dev libx265-dev libxml2-dev libxvidcore-dev libzimg-dev libzmq3-dev libzvbi-dev libplacebo-dev pocketsphinx-lm pocketsphinx-hmm-en-us
wget https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar -xf ffmpeg-snapshot.tar.bz2
cd ffmpeg
./configure --prefix=/usr --extra-cflags='-march=armv8-a+simd+crypto+crc -mtune=cortex-a57' --libdir=/usr/lib/aarch64-linux-gnu --arch=arm64 --enable-gpl --enable-shared --disable-stripping --disable-omx --disable-nvv4l2 --enable-gnutls --enable-libaom --enable-libass --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libglslang --enable-libgme --enable-libgsm --enable-libharfbuzz --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-openal --enable-opencl --enable-opengl --disable-sndio --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-ladspa --enable-libbluray --enable-libjack --enable-libpulse --enable-librabbitmq --enable-librist --enable-libsrt --enable-libssh --enable-libsvtav1 --enable-libx264 --enable-libzmq --enable-libzvbi --enable-lv2 --enable-sdl2 --enable-libplacebo --enable-librav1e --enable-pocketsphinx --enable-librsvg --enable-libjxl
make -j$(nproc)
sudo make install
sudo ldconfig
cd
rm -rf ffmpeg ffmpeg-snapshot.tar.bz2
rm -rf ffmpeg
apt install -y build-essential git cmake libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libnl-genl-3-dev libnl-route-3-dev libssl-dev libxml2-dev libnm-dev
rm -fr vanilla
git clone https://github.com/xtomasnemec/vanilla.git
cd vanilla
mkdir build && cd build
cmake ..
cmake --build . --parallel
sudo cmake --install .
cd
mkdir -p patches && cd patches
wget -q https://github.com/vanilla-wiiu/nexmon/releases/download/nx/brcmfmac.ko
wget -q https://github.com/vanilla-wiiu/nexmon/releases/download/nx/brcmfmac4356-pcie.bin
wget -q https://github.com/vanilla-wiiu/nexmon/releases/download/nx/brcmfmac4356-pcie.txt
sudo cp brcmfmac4356-pcie.bin /lib/firmware/brcm/
sudo cp brcmfmac4356-pcie.txt /lib/firmware/brcm/
sudo cp brcmfmac.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless/broadcom/brcm80211/brcmfmac/
sudo depmod -a
sudo rmmod brcmfmac || true
sudo modprobe brcmfmac
cd
rm -rf patches
echo "Success"