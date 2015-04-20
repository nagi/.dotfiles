import XMonad

main = xmonad defaultConfig
        { modMask = mod3Mask
        , terminal = "urxvt"
        , borderWidth = 2
        , normalBorderColor = "#000000"
        --, focusedBorderColor = "#F92672"
        , focusedBorderColor = "#F92672"
        }
