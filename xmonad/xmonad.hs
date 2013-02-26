--
-- An example, simple ~/.xmonad/xmonad.hs file.
-- It overrides a few basic settings, reusing all the other defaults.
--

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ className =? "GNU Image Manipulation Program" --> doFloat
    , className =? "Toolbox" --> doFloat
    , className =? "screenruler" --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "VirtualBox" --> doFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        -- To set up modMask see; https://wiki.archlinux.org/index.php/Xmodmap
        { modMask            = mod3Mask
        , borderWidth        = 2
        , terminal           = "gnome-terminal"
        , normalBorderColor  = "#000000"
        , focusedBorderColor = "#F92672" 
        , manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        } `additionalKeys`
        [ ((mod5Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock") ]
