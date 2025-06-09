pacman -S --noconfirm base-devel make cmake ffmpeg libnl sdl2 sdl2_image sdl2_ttf libxml2 libnm
git clone https://github.com/xtomasnemec/vanilla.git
cd vanilla
mkdir build && cd build
cmake ..
cmake --build . --parallel
sudo cmake --install .
echo "Success"