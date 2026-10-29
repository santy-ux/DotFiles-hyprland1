---- WINDOW RULES ----

hl.config({
    windowrulev2 = {
        -- Editor de texto (Xed)
        "opacity 0.88 0.78, class:^(xed)$",

        -- Navegador Web (Chromium)
        "opacity 0.92 0.85, class:^(chromium)$",

        -- Terminal (Kitty - como respaldo de Hyprland)
        "opacity 0.85 0.75, class:^(kitty)$",

        -- Administrador de archivos (Thunar)
        "opacity 0.85 0.75, class:^(thunar)$",
        "opacity 0.85 0.75, class:^(Thunar)$",

        -- Discord / Vesktop
        "opacity 0.88 0.78, class:^(discord)$",
        "opacity 0.88 0.78, class:^(vesktop)$",

        -- Menú de aplicaciones (Rofi)
        "opacity 0.85 0.75, class:^(Rofi)$",
        "opacity 0.85 0.75, class:^(rofi)$"
    }
})

---- LAYER RULES (Notificaciones y barras) ----

hl.config({
    layerrule = {
        "blur, swaync-control-center",
        "blur, swaync-notification-window",
        "ignorezero, swaync-control-center",
        "ignorezero, swaync-notification-window",
        "blur, rofi",
        "ignorezero, rofi"
    }
})
