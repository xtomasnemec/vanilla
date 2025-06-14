# Vanilla

This is a **work-in-progress** software clone of the Wii U gamepad for Linux (including Raspberry Pi and Steam Deck) and Android. No warranty is provided and everything should be considered **alpha** at best.

<p align="center">
    <img src="https://raw.githubusercontent.com/vanilla-wiiu/vanilla/master/images/screenshot1.png">
    <br>
    <a href="https://youtu.be/DSgFu4rDxgc">
        Announcement Video
    </a>
</p>

## What devices are supported?

- [Steam Deck](https://github.com/vanilla-wiiu/vanilla/wiki/Steam-Deck)
- [Linux](https://github.com/vanilla-wiiu/vanilla/wiki/Linux-Setup-Guide) (check [Wi-Fi hardware compatibility](https://github.com/vanilla-wiiu/vanilla/wiki/Wireless-Compatibility))
- [Nintendo Switch](https://github.com/vanilla-wiiu/vanilla/wiki/Linux-Setup-Guide) (requires [Broadcom firmware patch](https://github.com/vanilla-wiiu/nexmon) or [external Wi-Fi adapter](https://github.com/vanilla-wiiu/vanilla/wiki/Linux-Setup-Guide#nintendo-switch))
- [Android](https://github.com/vanilla-wiiu/vanilla/wiki/Android-Setup-Guide) (currently frontend only)
- [Windows](https://github.com/vanilla-wiiu/vanilla/wiki/Windows-Setup-Guide) (currently frontend only)
- [Raspberry Pi](https://github.com/vanilla-wiiu/vanilla/wiki/Linux-Setup-Guide) (requires [external Wi-Fi adapter](https://github.com/vanilla-wiiu/vanilla/wiki/Linux-Setup-Guide#raspberry-pi))
- *iOS* - Coming soon

## What Wi-Fi adapter should I use?

At a minimum, you will need an adapter that supports 802.11n 5GHz. Newer standards (e.g. 802.11ac) are backwards compatible and should work as long as they can run at 5GHz.

In practice, not all hardware/drivers appear to work at this time. Check the [Wireless Compatibility](https://github.com/vanilla-wiiu/vanilla/wiki/Wireless-Compatibility) page on the wiki to check if a card is confirmed working or not.

## Compiling (Linux)
Vanilla currently requires the following dependencies:

- Debian/Ubuntu 
  ```sh
  apt install build-essential cmake libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libnl-genl-3-dev libnl-route-3-dev libssl-dev libxml2-dev libnm-dev
  ```
- Fedora
  ```sh
  dnf install libavcodec-free-devel libavutil-free-devel libavfilter-free-devel libnl3-devel SDL2-devel SDL2_image-devel SDL2_ttf-devel openssl-devel make automake gcc gcc-c++ kernel-devel cmake libxml2-devel NetworkManager-libnm-devel
  ```
- Arch
  ```sh
  pacman -S base-devel make cmake ffmpeg libnl sdl2 sdl2_image sdl2_ttf libxml2 libnm
  ```
- Alpine/postmarketOS
  ```sh
  apk add build-base cmake sdl2-dev sdl2_image-dev sdl2_ttf-dev ffmpeg-dev libnl3-dev libxml2-dev openssl-dev networkmanager-dev
  ```

The build process is otherwise normal for a CMake program:

```
git clone https://github.com/vanilla-wiiu/vanilla.git
cd vanilla
mkdir build && cd build
cmake ..
cmake --build . --parallel
```

Optionally, to install the program:

```
sudo cmake --install .
```
## Setup
- Debian/Ubuntu
  ```sh
  curl -fsSL https://raw.githubusercontent.com/xtomasnemec/vanilla/refs/heads/master/debian.sh | sudo bash
  ```
- Fedora
  ```sh
  curl -fsSL https://raw.githubusercontent.com/xtomasnemec/vanilla/refs/heads/master/fedora.sh | sudo bash
  ```
- Arch
  ```sh
  curl -fsSL https://raw.githubusercontent.com/xtomasnemec/vanilla/refs/heads/master/arch.sh | sudo bash
  ```
- Alpine/postmarketOS
  ```sh
  curl -fsSL https://raw.githubusercontent.com/xtomasnemec/vanilla/refs/heads/master/alpine.sh | sudo sh
  ```
- Nintendo Switch (Ubuntu 24.04)
  ```sh
  curl -fsSL https://raw.githubusercontent.com/xtomasnemec/vanilla/refs/heads/master/switch.sh | sudo bash
  ```
- Steam Deck
  - For instalation: 
  ```sh
  curl -fsSL https://raw.githubusercontent.com/xtomasnemec/vanilla/refs/heads/master/deck.sh | sudo bash
  ```
  - For configuring Wi-Fi: 
  ```sh
  curl -fsSL https://raw.githubusercontent.com/xtomasnemec/vanilla/refs/heads/master/deckwifi.sh | sudo bash
  ```
## Running the program
- Run using
```bash
  cd vanilla
  sudo bash ./run.sh
```