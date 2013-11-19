import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.InsertPosition
import XMonad.Layout.Fullscreen
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.Dishes
import XMonad.Layout.StackTile
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns
import qualified Data.Map as M

main = xmonad =<< statusBar myBarCommand myPrettyPrint myXmobarKey myConfig

--------------------- xmobar stuff ----------------------
myBarCommand = "xmobar"

myPrettyPrint = xmobarPP
    { ppTitle   = xmobarColor "#00FF00" "" . shorten 100
    , ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" 
    }

myXmobarKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
--------------------- xmobar stuff ----------------------

myConfig = defaultConfig 
    { terminal           = myTerminal
    , workspaces         = myWorkspaces
    , modMask            = myModMask
    , borderWidth        = myBorderWidth
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , layoutHook         = myLayoutHook
    , keys               = myKeys <+> keys defaultConfig
    }

myTerminal = "urxvt"
myWorkspaces = ["1:web", "2:dev", "3:media", "4:torrents", "5", "6", "7", "8", "9", "0"]
myModMask = mod4Mask
myBorderWidth = 2
myNormalBorderColor = "#505050"
myFocusedBorderColor = "#d7d7d7"

myLayout = avoidStruts $
    ResizableTall 1 (3/100) (1/2) [] |||
    Mirror (ResizableTall 1 (3/100) (1/2) []) |||
    Full

myLayoutHook = smartBorders $ myLayout

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList
     [
       ((modMask, xK_s),
        spawn "$HOME/.scripts/switch_keyboard.sh")

     , ((modMask, xK_a), 
       sendMessage MirrorShrink)
 
     , ((modMask, xK_z), 
       sendMessage MirrorExpand)

     ]

