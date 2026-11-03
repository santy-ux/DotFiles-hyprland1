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

## Sobre este sistema

Escritorio sobre **Arch Linux** con **Hyprland**, configurado en Lua (`hyprland.lua`, `keybinds.lua`, `look.lua`, `rules.lua`). `Super` es la tecla principal.

- **Tide Island:** la isla dinámica de arriba, con control center, reproductor, notificaciones, portapapeles, calendario, clima y lanzador de aplicaciones de Swen enhao.
- **Menú de Settings** (Quickshell): sistema, audio, pantalla, red, bluetooth, almacenamiento, accesos a los archivos de configuración y temas.
- **Fondos de pantalla:** selector visual con `awww` (`Super + W`).
- **Temas 43pr:** genera los colores de Waybar y de la pantalla de bloqueo según el fondo, con modo claro/oscuro.
- **Pantalla de bloqueo** (hyprlock), **menú de apagado** (wlogout) y **lanzador** (rofi).
- **Waybar** viene incluida y se muestra u oculta con `Super + Shift + W`.
- **Alerta de batería** al bajar del 20 % y **aviso de actualizaciones** del repo al iniciar sesión.

## Atajos de teclado

### Programas y sistema
| Atajo | Acción |
|---|---|
| `Super + Return` | Abrir la terminal |
| `Super + D` | Lanzador de aplicaciones (rofi) |
| `Super + E` | Gestor de archivos (nautilus) |
| `Super + B` | Navegador |
| `Super + T` | Menú de Settings |
| `Super + W` | Selector de fondos de pantalla |
| `Super + L` | Cambiar tema claro/oscuro |
| `Super + O` | Cambiar la opacidad de las ventanas |
| `Super + Tab` | Bloquear pantalla |
| `Super + ` ` ` (tecla de la tilde invertida) | Menú de apagado |
| `Super + V` | Historial del portapapeles (rofi) |
| `Super + X` | Cambiar distribución del teclado |
| `Super + Shift + W` | Mostrar/ocultar Waybar |
| `Super + R` | Iniciar/detener grabación de pantalla |
| `Super + M` | Cerrar sesión de Hyprland |

### Ventanas
| Atajo | Acción |
|---|---|
| `Super + Q` | Cerrar ventana |
| `Super + F` | Pantalla completa |
| `Super + Space` | Ventana flotante centrada (alterna) |
| `Super + H / J / K / L` | Mover el foco izquierda / abajo / arriba / derecha |
| `Super + Shift + H / J / K / L` | Mover la ventana en esa dirección |
| `Super + Ctrl + H / J / K / L` | Cambiar el tamaño de la ventana |
| `Super + clic izquierdo` (arrastrar) | Mover ventana con el mouse |
| `Super + clic derecho` (arrastrar) | Redimensionar ventana con el mouse |

### Escritorios
| Atajo | Acción |
|---|---|
| `Super + 1 ... 9, 0` | Ir al escritorio 1 al 10 |
| `Super + Shift + 1 ... 9, 0` | Mover la ventana al escritorio 1 al 10 |

### Capturas y zoom
| Atajo | Acción |
|---|---|
| `Print` | Captura de toda la pantalla (se copia al portapapeles) |
| `Shift + Print` | Captura de un área |
| `Super + rueda del mouse` | Zoom de pantalla |
| `Super + + / -` (teclado numérico) | Zoom de pantalla |

### Tide Island
| Atajo | Acción |
|---|---|
| `Super + Alt + C` | Control center |
| `Super + Alt + P` | Reproductor |
| `Super + Alt + N` | Centro de notificaciones |
| `Super + Alt + V` | Portapapeles |
| `Super + Alt + K` | Calendario |
| `Super + Alt + W` | Clima |
| `Super + Alt + A` | Lanzador de aplicaciones |

### Teclas multimedia
Volumen, silencio, brillo y control de reproducción (play/pausa, siguiente, anterior) funcionan con las teclas de función del teclado.

### Notas
- `Super + R` usa `gpu-screen-recorder` y está configurado para el monitor `HDMI-A-1`; cambia ese nombre por el de tu pantalla (`hyprctl monitors`).
- Las capturas se guardan en `~/Imágenes/Capturas de pantalla/`, que debe existir.
- `Super + L` está asignado a dos acciones (cambiar tema y mover el foco a la derecha).

## Estructura del repositorio

```
DotFiles-hyprland1/
├── install.sh          instalador principal
├── install-aur.sh      instala los paquetes del AUR
├── packages.txt        paquetes de los repos oficiales
├── aur-packages.txt    paquetes del AUR
├── config/
│   ├── hypr/           Hyprland, atajos, reglas, hyprlock y scripts
│   ├── quickshell/     menú de Settings y selector de fondos
│   ├── tide-island/    ajustes de la isla
│   ├── 43pr/           sistema de temas
│   └── waybar, rofi, kitty, wlogout, ...
└── wallpapers/         fondos de pantalla
```
