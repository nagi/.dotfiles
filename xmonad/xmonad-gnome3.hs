import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ manageHook gnomeConfig
    , className =? "GNU Image Manipulation Program" --> doFloat
    , className =? "Toolbox" --> doFloat
    , className =? "screenruler" --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "VirtualBox" --> doFloat
    ]

main = xmonad gnomeConfig
        { modMask            = mod5Mask
        , borderWidth        = 4
        , terminal           = "gnome-terminal"
        , normalBorderColor  = "#000000"
        , focusedBorderColor = "#035EF3" 
        , manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        } 
