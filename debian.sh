apt update && apt upgrade -y
apt install -y build-essential cmake libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libnl-genl-3-dev libnl-route-3-dev libssl-dev libxml2-dev libnm-dev
git clone https://github.com/xtomasnemec/vanilla.git
cd vanilla
mkdir build && cd build
cmake ..
cmake --build . --parallel
sudo cmake --install .
echo "Success"