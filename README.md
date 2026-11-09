> These are my personal dotfiles for use on my own setup. Anyone is welcome to take inspiration, but directly cloning this repo into your .config is not a good idea. All config is subject to change.

## Recommended Installation

> These instructions are really just a note to self. Use with caution.

1. Switch to cachyos repos and check if v3 or v4 supported

   > Note: this curl is from cachyos themselves. Do not run random curl scripts.
   > This is not explicitly needed but recommended for performance.

   ```
   curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
   tar xvf cachyos-repo.tar.xz && cd cachyos-repo
   sudo ./cachyos-repo.sh
   ```

2. Install paru

   If using cachyos repos:

   ```
   sudo pacman -S paru
   ```

   If not using cachyos repos:

   ```
   sudo pacman -S --needed base-devel
   git clone https://aur.archlinux.org/paru.git
   cd paru
   makepkg -si
   ```

3. Edit `/etc/pacman.conf`:

   Recommended for speed, usability, and cool

   `Colors` and `ILoveCandy` are cosmetic

   Under `[options]`:

   ```
   Colors
   ILoveCandy
   VerbosePkgLists
   ParallelDownloads = 15
   ```

4. Install pacman packages

   ```
   sudo pacman -S niri noctalia xwayland-satellite ly pipewire pipewire-pulse wireplumber networkmanager bluez bluez-utils xdg-desktop-portal-gnome nautilus file-roller yazi kitty zen-browser neovim git zsh-theme-powerlevel10k zathura awww
   ```

   > noctalia supports wallpapers without the need for a dedicated wallpaper daemon, but this uses awww because it supports gifs
   > awww is not on the arch repos. If using arch repos, use awww-bin from AUR

5. Enable zsh and symlink zshrc

   ```
   chsh -s /bin/zsh
   ln -s ~/.config/zshrc ~/.zshrc
   ```

6. Install AUR packages with paru

   ```
   paru -S maplemono-ttf spotify spicetify-cli awww-bin
   ```

7. Enable services

   ```
   systemctl enable --now bluetooth
   systemctl enable --now NetworkManager
   systemctl enable ly@tty1
   systemctl enable --user mpd
   systemctl enable --user mpd-mpris
   ```

8. Spicetify

   After running spotify at least once:

   ```
   spicetify config current_theme text
   spicetify backup apply
   ```

9. Zen browser

   Zen browser is nice with this setup. I recommend it with the _Transparent Zen_ mod and _Zen Internet_ extension.
