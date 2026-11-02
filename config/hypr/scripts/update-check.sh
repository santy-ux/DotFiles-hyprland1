#!/usr/bin/env bash
REPO="${DOTFILES_DIR:-$HOME/DotFiles-hyprland1}"
[ -d "$REPO/.git" ] || exit 0

sleep 15

for i in $(seq 1 20); do
  git -C "$REPO" ls-remote -q origin HEAD >/dev/null 2>&1 && break
  sleep 3
done

git -C "$REPO" fetch -q origin || exit 0
behind=$(git -C "$REPO" rev-list --count "HEAD..@{u}" 2>/dev/null)

if [ "${behind:-0}" -gt 0 ]; then
  notify-send -u normal -i software-update-available "Dotfiles actualizados" \
    "Hay ${behind} cambio(s) nuevo(s). Ejecuta: cd ~/DotFiles-hyprland1 && git pull && ./install.sh"
fi
