#!/usr/bin/env bash
DOTS="$(cd "$(dirname "$0")" && pwd)"
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
  (cd /tmp/yay-bin && makepkg -si --noconfirm)
fi
grep -vE '^\s*(#|$)' "$DOTS/aur-packages.txt" | while read -r pkg; do
  yay -S --needed --noconfirm "$pkg" || echo "   [aviso] No se pudo instalar del AUR: $pkg"
done
