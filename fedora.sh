dnf install -y libavcodec-free-devel git libavutil-free-devel libavfilter-free-devel libnl3-devel SDL2-devel SDL2_image-devel SDL2_ttf-devel openssl-devel make automake gcc gcc-c++ kernel-devel cmake libxml2-devel NetworkManager-libnm-devel
git clone https://github.com/xtomasnemec/vanilla.git
cd vanilla
mkdir build && cd build
cmake ..
cmake --build . --parallel
sudo cmake --install .
echo "Success"