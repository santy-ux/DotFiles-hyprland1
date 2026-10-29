#!/usr/bin/env bash
set -e

DOTS="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

echo "==> Actualizando sistema..."
sudo pacman -Syu --noconfirm

echo "==> Instalando paquetes..."
sudo pacman -S --needed --noconfirm git base-devel
grep -vE '^\s*(#|$)' "$DOTS/packages.txt" | while read -r pkg; do
  sudo pacman -S --needed --noconfirm "$pkg" || echo "   [aviso] No se pudo instalar: $pkg"
done

echo "==> Respaldando configuración existente en $BACKUP"
mkdir -p "$BACKUP" "$HOME/.config"
for dir in "$DOTS"/config/*; do
  name="$(basename "$dir")"
  if [ -e "$HOME/.config/$name" ]; then
    mv "$HOME/.config/$name" "$BACKUP/"
  fi
done

echo "==> Copiando configuración..."
cp -r "$DOTS"/config/* "$HOME/.config/"

echo "==> Copiando wallpapers..."
mkdir -p "$HOME/Pictures/wallpapers"
cp -r "$DOTS"/wallpapers/. "$HOME/Pictures/wallpapers/" 2>/dev/null || true

echo ""
echo "Listo. Reinicia o cierra sesión y ejecuta 'Hyprland' desde la TTY."
