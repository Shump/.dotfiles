import XMonad
import XMonad.Layout.Spacing

myTerminal = "urxvt"
myWorkspaces = ["1:main", "2:web", "3:chat", "4:media", "5:browse", "6:dev", "7:mail"]
myModMask = mod4Mask
myBorderWidth = 2
myNormalBorderColor = "#505050"
myFocusedBorderColor = "#d7d7d7"

myLayout = tiled ||| Mirror tiled ||| Full
        where
             -- defualt tiling algorithm partitions the screen into two panes
             tiled = spacing 2 $ Tall nmaster delta ratio

             -- The default number of windows in the master pane
             nmaster = 1

             -- Default proportion of screen occupied by master pane
             ratio = 2/3

             -- Percent fo screen to increment by when resizing panes
             delta = 5/100

main = do
    xmonad $ defaultConfig { terminal = myTerminal
                           , workspaces = myWorkspaces
                           , modMask = myModMask
                           , borderWidth = myBorderWidth
                           , normalBorderColor = myNormalBorderColor  
                           , focusedBorderColor = myFocusedBorderColor
                           , layoutHook = myLayout
                           }


