#!/bin/sh

echo
echo "This installer assumes you have a basic Arch Linux installation already."
echo "If you don't yet, exit now and finish up- this may not work otherwise."
echo
echo "Continue? [Y/n]"
read CONFIRM_CONTINUE

if [ $CONFIRM_CONTINUE == "n" ] || [ $CONFIRM_CONTINUE == "N" ]; then
	echo "ok bye"
	exit
fi

echo

pacman -Q git >/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
	echo "Installing git..."
	sudo pacman -S git >/dev/null
fi

pacman -Q paru >/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
	echo "Installing paru..."
	sudo pacman -S --needed base-devel >/dev/null
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
fi

echo
echo "Installing packages via paru..."
paru -S hyprland-git \
		waybar-git \
		kitty \
		dunst \
		zsh \
		wl-clipboard \
		grim \
		slurp \
		zip \
		unzip \
		cava \
		tty-clock-git \
		spotify \
		firefox \
		pipewire \
		wireplumber \
		pipewire-audio \
		pipewire-pulse \
		vscodium-bin \
		ttf-twemoji \
		playerctl \
		ttf-dejavu \
		ttf-firacode-nerd \
		ttf-ibm-plex \
		ttf-jetbrains-mono-nerd \
		vim \
		xdg-desktop-portal-hyprland-git \
		nautilus \
		fastfetch \
		pfetch \
		hyprpaper \
		hyprsunset-git \
		btop \
		brightnessctl \
		noto-fonts \
		noto-fonts-cjk
		# add more later

echo
echo "Installing plug (for vim plugins)..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo
echo "Installing dotfiles:"
echo "  $(pwd)/.config/hypr/hyprland.conf"
mkdir -p ~/.config/hypr
# TODO finish this

echo
echo "Done!"
echo "Please reboot."
