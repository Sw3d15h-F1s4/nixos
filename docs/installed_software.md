been a while since i edited this doc. considering its been a year since i've started using linux and nix it's worth a shot.
i'll keep my rambling here and never delete anything so it may be confusing to read but imagine this is a conversation with myself --- cuz it is.
maybe you can find something useful in here.

# A Discussion of Installed Software

Because, frankly, I don't really have a list of what I (1) need, (2) want, (3) don't need.

Oh, and I'd like to explain why, for posterity's sake.

I'm a bit confused on if I should install things with nixos or home-manager, especially since there isn't a good reference on if something is
`programs.(program).enable = true;`. So, let's figure out some software.

I'll make a distinction between what I consider "desktop" software and "system" software, as I think this is a good distinction on whether to install
with home-manager or not. I think this boils down to a few factors.

 1) How configurable is the software?
   - If there are home-manager modules for the software, it might be a good idea to install with home-manager.
   - If the software doesn't need configuration (ever), it's likely a good idea to install system wide.
 2) What methods are available?
   - Is the software on Nixpkgs? 
      - If so, is there a nixos module (`programs.${program}.enable`)? Should probably use this method, as there may be additional tweaks.
      - Refer back to 1, if there is a home-manager module then that could be useful
 3) Who will use the software?
   - Well, tbh, I'll be the only user of my computer, likely. But, theoretically, should this software be available to all users?
     - If the software can be used by anyone with little to no configuration, then sure!
       - notable exceptions: neovim, as that is the default text editor on my system. nano will exist too.

The whole reason I'm using NixOS is for immutability -- that is, I don't want to be able to break my system, even intentionally. Software should be installed globally, if at all possible.
I think this means that I want to use home-manager as a nixos module. I'll have to rethink my configuration.

For the sake of this list, and the rest of my sanity, let's follow a rigorous algorithm to determine if something should be installed as a home package or a system package.

Install everything through nixpkgs.

Binaries are installed through NixOS.

Dotfiles are managed by home-manager. Keep exceptions minimal.

I think this is the best solution.


# List of Software

## Format
Columns: Name, Priority (lower number = higher priority), System or User, Module available?

### Priority (P)
0 is the highest priority, get these installed and configured first.

### System or User
Using the guidelines listed above, should this package be available system wide?

### Module
Whether or not a `programs.${program_name}.enable` exists. If yes and I want to use it, then YES. If none exists, then NO!
If it exists but I don't think its required (or home-manager does it better), then EH!
If home-manager does it better then HM
If I should probably install with a nixos module but configure with HM, then Y&HM.



## The List

### From my most stable, simple config: /etc/nixos

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| firefox       | 0 | System | Default Browser.                     | HM     |
| gtop          | 0 | User   | Fun. Use htop for actual work        | NO!    |
| htop          | 0 | System | Most functional.                     | HM     |
| xclip         | 0 | System | Arguably mandatory for Neovim        | NO!    |
| fzf           | 1 | User   | Haven't got used to using it yet     | HM     |
| fd            | 0 | System | Required for (most) neovim configs   | HM     |
| ripgrep       | 0 | System | "                                    | HM EH  |
| git           | 0 | System | Everyone needs to download things!?! | Y&HM   |
| fastfetch     | 0 | System | Everyone needs to see I RUN NIXOS    | HM     |
| mangohud      | 0 | System | It's a gaming computer.              | HM     |
| protonup      | 0 | System | It's a gaming computer.              | NO!    |
| steam         | 0 | System | It's a gaming computer.              | YES    |
| gamescope     | 0 | System | It's a gaming computer.              | YES    |
| neovim        | 0 | System | Default editor.                      | nixvim |
| discord       | 2 | User   | Peice of shit software.              | no     |
| prismlauncher | 2 | User   | Minecraft.                           | NO!    |
| vscode        | 1 | System | Alternate Editor                     | HM     |
| lf            | 0 | System | File Explorer                        | HM     |

From here, duplicate package entries are omitted. Each source will only list *additional* entries.

### From my old laptop's configuration.

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| GCC           | 4 | System | C Compiler. Need one for nvim.       | NO!    |
| clang         | 4 | System | C Compiler.                          | NO!    |
| python3       | 4 | System | Python 3.xx.                         | NO!    |
| ~~neofetch~~  | 9 | System | Deprecated.                          | NO!    |
| tmux          | 3 | System | Use zellij? Also in case of tty.     | HM     |
| zellij        | 3 | System | Use tmux?                            | HM     |
| wget          | 5 | System | TBH idk if needs to be permanent     | NO!    |
| curl          | 5 | System | See wget                             | NO!    |
| bintools      | 5 | System | binutils wrapper. use nix develop    | NO!    |
| unzip         | 3 | System | ark doe?                             | NO!    |
| zip           | 3 | System | see unzip                            | NO!    |
| p7zip         | 3 | System | see unzip                            | NO!    |
| unrar         | 3 | System | see unzip                            | NO!    |
| pciutils      | 1 | System | hidden KDE dependency.               | NO!    |
| usbutils      | 1 | System | hidden KDE dependency.               | NO!    |
| goverlay      | 1 | User   | manage mangohud. Does it work?       | NO!    |
| protontricks  | 1 | System | gaming computer                      | NO!    |
| java          | 1 | System | this is for JDK                      | YES    |
| nix-ld (alien)| 1 | System | Check back in with nix-alien.        | FLAKE  |
| btop          | 0 | System | alternative to gtop                  | HM     |
| kitty         | 1 | System | alternative to alacritty             | HM     |
| gnupg         | 1 | System | support PGP keys  :poop: gpg-agent   | YES    |
| gh            | 4 | System | github cli                           | HM     |
| gimp          | 4 | User   | check in on krita?                   | NO!    |
| kicad         | 1 | User   | im an electrical engineer            | NO!    |
| qalculate-qt  | 1 | User   | im an electrical engineer            | NO!    |
| libreoffice   | 1 | User   | gotta be able to write documents     | NO!    |
| hunspell      | 1 | User   | for libreoffice, Dicts.en\_US        | NO!    |


### From Goxore/nixconf (vimjoyer)
What follows is the start of a list of "discovery" packages. Things I've never used, but have seen used elsewhere. I may omit random things.

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| youtube-music | X |        | I don't use youtube music.           | NO!    |
| tdesktop      | X |        | I'm not a telegram user              | NO!    |
| feh           | X |        | image viewer. kde has one right?     | NO!    |
| noisetorch    | X |        | noise filter for pipewire!           | YES    |
| polkit        | X |        | Why explicitly install this?         | YES    |
| lxsession     | X |        | i don't run lxde                     | NO!    |
| pulsemixer    | X |        | im running pipewire now              | NO!    |
| pavucontrol   | X |        | im running pipewire now              | NO!    |
| adwaita-qt    | X |        | UNMAINTAINED use qt.style option     | tech   |
| pcmanfm       | X |        | i'm using dolphin since kde          | NO!    |
| libnotify     | X |        | wayland notification daemon          | NO!    |
| pywal         | X |        | similar to lutgen? also archived     | HM EH  |
| neovide       | X |        | GUI wrapper for neovim               | NO!    |
| ripdrag       | X |        | drag/drop files in terminal          | NO!    |
| mpv           | X |        | video player                         | HM     |
| sxiv          | X |        | image viewer.                        | NO!    |
| zathura       | X |        | document viewer. okular?             | HM     |
| lm sensors    | X |        | monitor hardware sensors. kde?       | NO!    |
| upower        | X |        | battery and power status             | YES    |
| cm unicode    | X |        | computer modern unicode fonts        | NO!    |
| virt-manager  | X |        | virtual machine manager              | YES    |
| wezterm       | X |        | terminal, lua config, feature rich   | HM     |
| onlyoffice-bin| X |        | most hotly debated topic of forever  | YES    |
| easyeffects   | X |        | audio effects for pipewire           | HM     |
| gegl          | X |        | data-flow based imaging processing.  | NO!    |
| lutris        | X |        | unified games launcher               | NO!    |
| protonup-ng   | X |        | CLI-only version of protonup (-qt)   | NO!    |
| dxvk          | X |        | directx-to-vulkan layer              | NO!    |
| r2modman      | X |        | simple mod manager for a few games   | NO!    |
| heroic        | X |        | substitute for epic games launcher   | NO!    |
| nil           | X |        | nix LSP                              | NO!    |
| pistol        | X |        | better TUI file previewer            | HM     |
| file          | X |        | shows type of files (MIME?)          | NO!    |
| stow          | X |        | for managing dotfiles                | NO!    |
| imagemagick   | X |        | image processing commands            | NO!    |
| killall       | X |        | kills a process given name           | NO!    |
| eza           | X |        | ls replacement (looks nice)          | HM     |
| zoxide        | X |        | cd replacement (bruh what??)         | HM     |
| du-dust       | X |        | du sub (like gdu, ncdu, etc)         | NO!    |
| ffmpeg        | X |        | the holy grail of audio/video        | NO!    |
| yt-dlp        | X |        | TUI video downloader                 | NO!    |
| tree-sitter   | X |        | tree-sitter-cli for neovim           | NO!    |
| nh            | X |        | nix-helper, uses nom and nvd         | YES    |
| lazygit       | X |        | my fav git front end                 | YES HM |
| bat           | X |        | cat replacement with syntax highlight| HM     |
| imv           | X |        | image viewer                         | HM     |
| sxhkd         | X |        | x hotkeys                            | YES HM |
| xorg.xev      | X |        | x event log                          |        |
| .xbacklight   | X |        | adjust backlight brightness          |        |
| .xhost        | X |        | add allowed users to x server        |        |
| maim          | X |        | screenshot (kde: spectacle)          | NO!    |
| xdotool       | X |        | mouse jiggler?                       | NO!    |
| devour        | X |        | hides current window and launches    | NO!    |
| ueberzug      | X |        | display images in terminal           | NO!    |
| picom-jonaburg| X |        | lightweight X compositor             | YES HM |
| zsh           | X |        | the ZSH shell                        | YES HM |
| ctpv          | X |        | terminal file previewer              | NO!    |
| yazi          | X |        | terminal file manager                | YES HM |
| direnv        | X |        | run commands upon CD                 | YES HM |
| stylix        | X |        | auto color themes                    | FLAKE  |
| rofi          | X |        | window switcher                      | idk    |
| chromium      | X |        | browser                              | YES    |
| vesktop       | X |        | Vencord discord mod (alt client)     | NO!    |
| rbw           | X |        | unnoficial bitwarden client          | HM     |
| tenacity      | X |        | sound editor (like audacity?)        | NO     |
| bottom        | X |        | like top/htop/gtop/btop/etc          | HM     |

### From EmergentMind/nix-config

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| remmina       | X |        | remote desktop client (GTK)          | YES    |
| inkscape      | X |        | vector graphics editor               | YES    |
| rpi-imager    | X |        | raspberry pi imaging utility         | NO!    |
| etcher        | X |        | ISO flasher                          | NO!    |

### From wiltaylor/dotfiles

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| kdenlive      | X |        | video editor (KDE)                   | NO!    |
| foot          | X |        | wayland terminal emulator            |        |
| pandoc        | X |        | document converter                   | HM     |
| krdc          | X |        | remote desktop client (KDE)          | NO!    |

### From librephoenix/nixos-config

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| qutebrowser   | X |        | keyboard focused browser (Qt)        | HM     |
| libreoffice   | X |        | -fresh, -qt                          | NO!    |
| mate.atril    | X |        | document viewer                      | NO!    |
| openboard     | X |        | whiteboard application               | NO!    |
| newsflash     | X |        | feed reader (RSS, etc)               | NO!    |
| foliate       | X |        | GTK ebook reader                     | NO!    |
| texliveSmall  | X |        | tex live lmaooooo                    | HM~    |
| numbat        | X |        | calculator with units                | NO!    |
| krita         | X |        | drawing application                  | NO!    |
| pinta         | X |        | paint.net clone                      | NO!    |
| musikcube     | X |        | terminal based music player          | NO!    |
| openscad      | X |        | programmable 3d models               | NO!    |
| obs-studio    | X |        | its obs                              | HM     |
| ardour        | X |        | foss multi track mixer/editor        | NO!    |
| rosegarden    | X |        | music composition / midi?            | NO!    |
| ventoy        | X |        | bootable USB with multiple OS        | NO!    |
| superTuxKart  | X |        | SUPER TUX KART HOLY SHIT LETS GOO    | NO!    |
| pegasus-front | X |        | emulator/game launcher               | NO!    |
| airshipper    | X |        | game specific to Veloren             | NO!    |
| blueman       | X |        | bluetooth manager (GTK)              | YES    |


### Things I found that Could Be Cool (to format later)
 - git LFS (nixos module)



# What to Install
So, this begs the question. What software do I actually want to install? I should do this based on categories.


## Office Suite: OnlyOffice-bin latest
Of course, I'll need an office suite. This is hotly debated between OnlyOffice and LibreOffice.
OnlyOffice simlply has better visuals. People say it's more Word compatible too, which is helpful since my 
university is 100% micsrosoft.
No config needed

## Image editor: Krita and GIMP, Inkscape

Next, I need some way to edit images. The classic choices are GIMP, Krita, Pinta, and some others
TBH I don't mind installing both GIMP and Krita.
Note: GIMP plugins can also be installed from nixpkgs!

Inkscape because vector images are a whole different beast
no config needed


## Video Editor: Kdenlive
TBH I'm not sure whether to go with DaVinci Resolve or Kdenlive. I've used DaVinci in the past, so I'll try it.
EDIT: nah. kdenlive for the win. davinci codecs on linux are not something I feel like messing with, and i do this so rarely anyway.
no config needed


## Text Editor: Neovim (and vscode)
OK OK OK I GET IT. Sometimes vscode with a vim plugin is fine, like when dealing with arduino or much larger projects.
Neovim is a text editor, not an IDE. As much as we can add plugins to do so, I'm sorry but the debugging/IDE experience
provided by vscode is simply better out-of-the-box.

That being said, I'll basically use neovim for pretty much everything. Would be cool to add neovide (or any other neovim gui).
heavy config needed for both

i've changed my mind with this. i kinda hate vscode, neovim is the way to go. if i need to debug again i'll look into something else.


## Games: Steam, Lutris.
Should be a no brainer.
mangohud
protonup
protontricks
gamescope.enable
gamemode.enbable
no config needed

## Browser: Firefox
DUH!
might have to change, but do i care?
config needed


## Other productivity
kicad - install from flatpak. the nixpkgs version is broken on wayland (intentionally?)
qalculate-qt
mpv
no config needed

## CLI utilities
gtop
htop
fzf
fd
ripgrep
git
fastfetch
lf - i was a bit interested in using a terminal based file manager. now i realize it literally doesn't matter and dolphin is good.
tmux - i just use zellij or multiple alacritty windows
zellij
pciutils
usbutils
gh
eza
zoxide - replaced with z fish plugin
du-dust - i don't use it
nh
nil
alejandra
lazygit
bat
various configs needed

## Useful desktop stuff!
noisetorch - ended up being not useful. use vesktop which has noise suppression support. i kind of hate linux audio...


## Main shell
I like fish. its super easy to use and customize. Zsh is cool and compliant or whatever, but like hit em with the exec bash if you need it.
plus making a usable zsh config is harder than nixos.

hm config needed
on this point i made a custom prompt but that's about it. i don't really need much else so there's not a lot of config for fish.




I likely won't maintain this list of software beyond initial reasoning. After all, another reason I want to use NixOS is to make installing new
software dead simple: add a line/file, rebuild, forget about it. If you want to see what software I use currently, reading nix configs is a
useful skill to develop (for me as well!). It's something I like about NixOS; the less I have to read `apt list --installed | grep manual` the better.


# The switch to NVF
I decided to switch to NVF since it's the new flashy thing, and it was time to rewrite my neovim config anyway. Lol. I was kind of dreading writing
my NixVim config, as it was a bit of a nightmare to get right in the first place. Also I didn't really find NixVim's way of configuring plugins to 
be all that great, and I kinda wanted lazy loading. Now, NVF has great lazy loading support, decent OOTB configurations, and is logically organized.
It is very conducive to splitting your config into multiple files. I'm a fan, at least. 

Also, I decided to make my neovim configuration entirely standalone from my nixos config. So I'll have to set my theme in two places, who cares. No 
way in hell was I going to try to get my hacky nix color thing to generate nvim highlight groups. This way, I can test/edit/hack on my nvim config
in a different repo and not worry about rebuilding my system config from scratch every time. Maybe I'll add it as a git submodule?

edit: oh hell no. do not use flakes as a submodule. what the fuck. who thought "nixos-rebuild switch .?submodules=1#" was good syntax?? the fuck?
