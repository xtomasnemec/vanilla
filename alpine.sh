apk add build-base cmake sdl2-dev git sdl2_image-dev sdl2_ttf-dev ffmpeg-dev libnl3-dev libxml2-dev openssl-dev networkmanager-dev
git clone https://github.com/xtomasnemec/vanilla.git
cd vanilla
mkdir build && cd build
cmake ..
cmake --build . --parallel
sudo cmake --install .
echo "Success"