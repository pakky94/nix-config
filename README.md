# NixOS config

## WSL installation

### Nix

```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

#### Enable flakes & nix-commands

In `/etc/nix/nix.conf` add

```
experimental-features = nix-command flakes
```

#### Home-manager

```sh
nix run home-manager/master -- switch --flake ~/p/nix-config#wsl-personal
```

#### Other stuff

```sh
sudo apt-get install libfuse2 xdg-utils
```

```sh
sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update
sudo apt install wslu
```

### Jetbrains Toolbox

Fix wayland socket with symlink

```sh
systemctl --user enable symlink-wayland-socket.service
```


## SteamDeck installation


```sh

parted /dev/nvme0n1 -- mklabel gpt
parted /dev/nvme0n1 -- mkpart primary 512MB -8GB
parted /dev/nvme0n1 -- mkpart primary linux-swap -8GB 100%
parted /dev/nvme0n1 -- mkpart ESP fat32 1MB 512MB
parted /dev/nvme0n1 -- set 3 esp on

mkfs.ext4 -L nixos /dev/nvme0n1p1
mkswap -L swap /dev/nvme0n1p2
mkfs.fat -F 32 -n boot /dev/nvme0n1p3

mount /dev/disk/by-label/nixos /mnt
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/nvme0n1p2

nixos-generate-config --root /mnt

```

Update hardware-configuration

```sh
rm ./hosts/steamdeck/hardware-configuration.nix
mv /mnt/etc/nixos/hardware-configuration.nix ./hosts/steamdeck/
```

Install NixOS

```sh
nixos-install --flake '.#steamdeck' --impure
```

