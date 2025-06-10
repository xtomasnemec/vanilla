cd build
cd bin
read -p "Run windowed? [y/N] " answer
if [[ "$answer" =~ ^[yY](es)?$ ]]; then
    ./vanilla-pi -w
else
    ./vanilla-pi
fi