# Dotfiles Hyprland

Configuración de Hyprland con Waybar y más.

## Instalación (Arch Linux)

```bash
sudo pacman -S --needed git
git clone https://github.com/santy-ux/DotFiles-hyprland1.git
cd DotFiles-hyprland1
./install.sh
```

El instalador respalda tu configuración actual en `~/.config-backup-FECHA`.

Después, inicia Hyprland escribiendo `Hyprland` en la TTY.

## Nota
Revisa `config/hypr/hyprland.conf` y ajusta la línea `monitor=` a tu pantalla.

## Actualizar

Para recibir los cambios nuevos de los dotfiles:

```bash
cd ~/DotFiles-hyprland1
git pull
./install.sh
```

Tu configuración anterior queda guardada en `~/.config-backup-FECHA`, así que si cambiaste algo por tu cuenta, ahí lo puedes recuperar.

Para actualizar los programas del sistema (incluye los del AUR):

```bash
yay -Syu
```

## Alerta de batería

Avisa con una notificación cuando la batería baja del 20 % y no está cargando. Para cambiar el porcentaje, edita `THRESHOLD` en `~/.config/hypr/scripts/battery-alert.sh`. Para quitarla, borra la línea de `battery-alert.sh` en `~/.config/hypr/hyprland.lua`.

## Aviso de actualizaciones

Al iniciar sesión, un script revisa si hay cambios nuevos en el repo y te avisa con una notificación. Funciona si la carpeta está en `~/DotFiles-hyprland1`. Para quitarlo, borra la línea de `update-check.sh` en `~/.config/hypr/hyprland.lua`.
