{
  xdg.configFile."ghostty/config".text = ''
    theme = dark:tokyonight,light:tokyonight-day

    keybind = global:alt+grave_accent=toggle_quick_terminal

    font-family = TX-02
    font-size = 15

    fullscreen

    background-blur = true
    background-blur-radius = 20
    background-opacity = 0.95
    unfocused-split-opacity = 0.95

    macos-auto-secure-input = true
    macos-secure-input-indication = true

    mouse-hide-while-typing = true

    window-padding-x = 20
    window-padding-y = 20
    window-padding-balance = true
  '';
}
