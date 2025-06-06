{
  xdg.configFile."systemd/user/symlink-wayland-socket.service".text =
    ''
[Unit]
Description=Symlink Wayland socket to XDG_RUNTIME_DIR

[Service]
Type=oneshot
ExecStart=/usr/bin/ln -s /mnt/wslg/runtime-dir/wayland-0      $XDG_RUNTIME_DIR
ExecStart=/usr/bin/ln -s /mnt/wslg/runtime-dir/wayland-0.lock $XDG_RUNTIME_DIR

[Install]
WantedBy=default.target
    '';
}
