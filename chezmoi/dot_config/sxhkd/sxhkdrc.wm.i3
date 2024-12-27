#
# i3 hotkeys
#

# restart wm (meh + q)
alt + ctrl + shift + q
	i3-msg restart && notify-send 'i3 restart'

# quit to display manager (hyper + q)
super + alt + ctrl + shift + q
	i3-nagbar -t warning -m 'Logout?' -B 'Yes' 'i3-msg exit'

# focus motions
alt + ctrl + shift + {h,j,k,l}
	i3-msg focus {left,down,up,right}

# move motions
super + alt + ctrl + shift + {h,j,k,l}
	i3-msg move {left,down,up,right}

# focus workspace
alt + ctrl + {1-9,0}
	i3-msg workspace number {1-9,10}

# send to workspace
super + alt + ctrl + {1-9,0}
	i3-msg move container to workspace number {1-9,10}

# fullscreen toggle
alt + ctrl + shift + f
	i3-msg fullscreen toggle

# toggle split (rotate)
alt + ctrl + shift + o
	i3-msg layout toggle split

# split below
alt + ctrl + shift + s
	i3-msg split v

# toggle float (center)
alt + ctrl + shift + t
	i3-msg floating toggle

# split right
alt + ctrl + shift + v
	i3-msg split h

# kill window
alt + ctrl + shift + w
	i3-msg kill

# grow width/height
alt + ctrl + shift + {Right,Up}
	i3-msg resize grow {width,height} 10 px or 10 ppt

# shrink width/height
alt + ctrl + shift + {Left,Down}
	i3-msg resize shrink {width,height} 10 px or 10 ppt

# move floater
super + alt + ctrl + shift + {Left,Down,Up,Right}
	i3-msg move {left,down,up,right}
