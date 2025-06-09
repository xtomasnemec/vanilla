apt install build-essential cmake libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libnl-genl-3-dev libnl-route-3-dev libssl-dev libxml2-dev libnm-dev
git clone https://github.com/xtomasnemec/vanilla.git
cd vanilla
mkdir build && cd build
cmake ..
cmake --build . --parallel
sudo cmake --install .
cd
cd vanilla
mkdir patches && cd patches
wget https://github.com/vanilla-wiiu/nexmon/releases/download/nx/brcmfmac.ko
wget https://github.com/vanilla-wiiu/nexmon/releases/download/nx/brcmfmac4356-pcie.bin
wget https://github.com/vanilla-wiiu/nexmon/releases/download/nx/brcmfmac4356-pcie.txt
cp brcmfmac4356-pcie.bin /lib/firmware/brcm/
cp brcmfmac4356-pcie.txt /lib/firmware/brcm/
rmmod brcmfmac
cp brcmfmac.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless/broadcom/brcm80211/brcmfmac/
modprobe brcmfmac
cd
cd vanilla
rm -rf patches
echo "Success"