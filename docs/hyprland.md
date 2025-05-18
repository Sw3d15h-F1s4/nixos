The Great Hyprland Migration
============================

Wow this has been miserable. Installing hyprland was easy enough. Really, I'm just mad about undocumented settings in Nixos and the weird way SDDM themes are set. As well as GTK and QT themes. Ugh.


I used to use KDE's apps for nearly everything. Now I must rethink that apparently.

# Things I learned
Here are some random musings that I want to remember to document my suffering.

SDDM themes are written in QML and are honestly not terribly difficult to write, just time consuming. SDDM lacks great documentation about their custom QML modules (and what version of QtQuick to use) and apparently is Qt5 by default unless you override the package setting to use kdePackages.sddm. There's only a few of these packaged on nixpkgs, and I'm not a huge fan of really any of them. sddm-astronaut appears to be good enough but MAN was it hard to find what to override the settings with. Knowing you *can* override settings is much more difficult than knowing *what* to put in the new config.

My favorite QT theme is breeze. Its clean, simple, and refined. I don't like utterly-nord-plasma, its blue on more blue with blue accents. Unfortunately, breeze is part of KDE, and is ludicrously convoluted to get working outside of KDE. Apparently the nixos settings qt.theme = "breeze" just doesn't work, and you MUST use qt[6/5]ct unless I'm mistaken, which feels really strange. I expected the nixos setting to just pass a package in and be done with it. You can specify a package, but then you also need to pass a name string which comes from "somewhere." Not clear.

I like QT. Everyone else seems to be a mac fanboy and prefer GTK apps instead. Ok, fine. But when I google "set QT theme hyprland nixos" my god everyone is talking about GTK themes and like 400+ lines of symlinking random shit. I don't know what a kvantum is, man i just wanted breeze. This could be simpler, that would be nice. To prolong my life and reduce stress, I'll likely just suck it up and use GTK apps where possible since setting a theme was easy. I wonder where I can browse GTK themes.

Mouse cursors. Again I wanted to use the breeze cursor. What's the correct 'nix way' to do this? weird.

I have a desktop and a laptop. My desktop has two monitors, my laptop has only one. I *need* different hyprland monitor configs for both. This nix config structure is nice for small edits, but adding in host dependent home manager configurations was challenging. I wanted to have an option set, for example config.defaultmonitor, which would be something like "DP-1" on my desktop and whatever on my laptop. I could never get this to work, probably something to do with my uhh weird way of doing things lmao. maybe ill return to this later.

no reasonable default config is not about being "unopinionated." its just stupid. sometimes I want to install something and have it "just work" even if it looks not the way I want to. sometimes I want to evaluate whether it would be worth investing time into writing a config before writing said config. a reasonable default config would be a great way to do this. queue the arguments.

# Default Apps.

## Music
Must be able to play locally stored music (mp3, flac, ogg) and create playlists. Must be able to shuffle.
Prior app: Elisa.

Candidates:
 - g4music (gapless)
 - amberol: cool but doesnt do playlists
 - most others are ugly
 - gnome-music: doesnt work without gnome

Selected: gapless

## PDF Viewer
No real preferences here.
Prior app: Okular

Candidates:
 - evince (gnome's default)
 - gv: too old lmao
 - i didnt know adobe reader was on nixpkgs wut
 - okular (its so good)

Selected: okular (its too good to pass up tbh)

## Screenshot Utility
Nothing fancy. I'd like to keybind it to WIN+SHIFT+S for muscle memory's sake. need to select a reigon. would like to have preview/edit
Prior app: Spectacle

Candidates:
 - hyprshot (works with hyprland by default, but cmd line which is ok ig)
 - literally everything is a wrapper for grimblast/slurp

Selected: hyprshot (they are all the same)


## Video viewer
Prior app: none (lmao)

candidates:
 - totem: doesnt work outside gnome
 - mpv (its so simple)
 - VLC (its a classic)
 - celluloid: a nicer front end for mpv

Selected: celluloid *EDIT* bruh celluloid doesnt work it inverts the video and puts a black screen over it, weirdly mpv works fine. moved to clapper

## Image viewer
I literally use this twice. but like. when you need it you need it. i'd also like the ability to make quick edits (say like circling something on the screenshot i just took)
Prior app: gwenview

candidates:
 - loupe (gnome default, actually works)
 - image-roll (super simple also works but hasn't been updated in 3y)
 - vipsdisp (cant copy for some reason)

Selected: image-roll, it might just be rusting. works for now tho!

## Partition manager/disk formatter
ok maybe i can get away with cmdline
Prior app: KDE Partition Manager


## Scanner UI
fuck you HP
Prior app: skanpage

simple-scan is like the only other one


## Calculator
I love Qalculate. Should likely switch to GTK version
Prior app: qalcuate-qt

## Video editor
I'd probably stick with kdenlive lmao

## Note taking
Draw on PDF. Import PDF on separate pages. Export PDF according to those separate pages. Not fuck up the pages.
Prior app: Xournal (apparently this already uses gtk?)
ill try rnote again

## bluetooth
cant believe i hadnt thought of this

Overskride - nevermind this one doesn't work stick to blueman

## Wifi settings
nm-applet
