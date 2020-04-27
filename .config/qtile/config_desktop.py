#------------------------------------------------------------------------#

#                        mmmm
#   mmm                 m"  "m
#  #" "#                #    #
#  #   #                #    #
#  "#m#"                 #mm#
#
#        """""""""""""
# Archivo de configuración para Qtile.

#------------------------------------------------------------------------#

## Creado por GIBRANLP 2020
## Cualquier cosa --> info@gibranlp.dev
## No sólo ejecutes este script, analiza o__O Investiga!
## ¡Aprende y Diviertete!

#------------------------------------------------------------------------#

import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Match, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import Spacer
import subprocess
import json

##### PYWAL GENERATED PALETTE IS USED HERE #####
with open('/home/gibranlp/.cache/wal/colors.json') as json_file:
    data = json.load(json_file)
    colorsarray = data['colors']
    specialarray =data['special']
    val_list = list(colorsarray.values())
    def getList(val_list):
        return [*val_list]
    val_list_special = list(specialarray.values())
    def getList(val_list_special):
        return [*val_list_special]

def init_colors():
    return [*val_list + val_list_special]

##### DEFINING SOME WINDOW FUNCTIONS #####

@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

##### LAUNCH APPS IN SPECIFIED GROUPS #####

def app_or_group(group, app):
    def f(qtile):
        if qtile.groups_map[group].windows:
            qtile.groups_map[group].cmd_toscreen()
        else:
            qtile.groups_map[group].cmd_toscreen()
            qtile.cmd_spawn(app)
    return f

##### GROUPS #####

groups = [
    Group("1", exclusive=False,init=True,persist=True, matches=[Match(wm_class=['URxvt', 'Nm-applet','MEGASync', 'thunar', 'Thunar', 'Com.github.aimproxy.dotfonts','Lightdm-gtk-greeter-settings','Blueberry.py', 'gnome-disks', 'Gnome-disks'])],position=1,layout="monadtall",label=""),
    Group("2", init=True,exclusive=True, matches=[Match(wm_class=['Tusk', 'Zoom','zoom','telegram-desktop-bin','whatsapp-nativefier-d52542','Hexchat','TelegramDesktop','MEGAsync'])],position=2,layout="monadtall",label=""),
    Group("3", init=True,exclusive=True, matches=[Match(wm_class=['vlc','Mailspring','mailspring','MEGAsync','firefoxdeveloperedition','firefox','Filezilla','transmission-gtk','Transmission-gtk'])],position=3,layout="monadtall",label=""),
    Group("4", init=True,exclusive=True, matches=[Match(wm_class=['vlc','Atom', 'atom', 'Typora','Evince', 'MEGAsync','DesktopEditors'])],position=4,layout="monadtall",label=""),
    Group("5", init=True,exclusive=True, matches=[Match(wm_class=['Gimp-2.10','Inkscape','feh', 'Com.github.phase1geo.minder', 'MEGAsync'])],position=5,layout="monadtall",label=""),
    Group("6", init=True,exclusive=True, matches=[Match(wm_class=['vlc','VirtualBox Manager', 'VirtualBox Machine'])],position=6,layout="monadtall",label=""),
    Group("7", init=True,exclusive=True,matches=[Match(wm_class=['Spotify','spotify'])],position=7,layout="monadtall",label="")]


#### SHORTCUTS ####

def init_keys():
    keys = [
            Key([mod, "shift"], "Return", lazy.spawncmd()),
            Key([mod], "q",lazy.window.kill()), # Kill Window
            Key([mod], "r",lazy.restart()), # Restart Qtile
            Key([mod, "shift"], "q",lazy.shutdown()), # Logout
            Key([mod, "control"], "k",lazy.layout.section_up()),# Move up a section in treetab
            Key([mod, "control"], "j",lazy.layout.section_down()), # Move down a section in treetab

            #### Monadtall Layout Keybindings ####
            Key([mod], "Tab",lazy.layout.down()), # Change focus of windows down
            Key([mod, "shift"], "Tab",lazy.layout.up()), # Change focus of windows up
            Key([alt], "Tab", lazy.layout.swap_left()),
            Key([alt, "shift"], "Tab", lazy.layout.swap_right()),
            Key([mod], "h", lazy.layout.left()),
            Key([mod], "l", lazy.layout.right()),
            Key([mod], "Up", lazy.layout.down()),
            Key([mod], "Down", lazy.layout.up()),


            Key([mod], "i", lazy.layout.grow()),
            Key([mod], "m", lazy.layout.shrink()),
            Key([mod], "n", lazy.layout.normalize()),
            Key([mod], "o", lazy.layout.maximize()),
            Key([mod, "shift"], "space", lazy.layout.flip()),

            Key([mod], "Left", lazy.group.prevgroup()),
            Key([mod], "Right", lazy.group.nextgroup()),

            #### Brightness
            Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
            Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),

            #### Volume
            Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
            Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
            Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),

            # Switch groups
	        Key([mod], 'Left', lazy.screen.prev_group(skip_managed=True, )),
	        Key([mod], 'Right', lazy.screen.next_group(skip_managed=True, )),
	        Key([mod], 'Escape', lazy.screen.togglegroup()),

            #### Media Control
            Key([mod], "v", lazy.spawn('/home/gibranlp/MEGA/computerStuff/keyboard/keyboard_activate.sh')),
            Key([mod], "b", lazy.spawn('/home/gibranlp/MEGA/computerStuff/keyboard/keyboard_deactivate.sh')),
            Key([], "XF86AudioPlay", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")),
            Key([], "XF86AudioNext", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")),
            Key([], "XF86AudioPrev", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")),
            Key([], "XF86AudioStop", lazy.spawn("cmus-remote --stop")),

            ### Window hotkeys
            Key([alt], "f", lazy.window.toggle_fullscreen()),
            Key([alt, "shift"], "f", lazy.window.toggle_floating()),

            ### Screenshots
            Key([], "Print", lazy.spawn("scrot -e 'mv $f /home/gibranlp/Pictures/screenshots/'")),

            ##### GROUPS (DESKTOPS) #####

            ## Group 1 (Tools, )
            Key([mod], "Return", lazy.spawn(myTerm)),
            Key([mod],"e",lazy.function(app_or_group("1", "thunar"))),

            ## Group 2 (Social: Whatsapp, Telegram, )
            Key([mod, "shift"],"w",lazy.function(app_or_group('2', 'whatsapp-nativefier-dark'))),
            Key([mod, "shift"],"t",lazy.function(app_or_group('2', 'telegram'))),
            Key([mod],"z",lazy.function(app_or_group('2', 'zoom'))),

            ## Group 3 (WEB: Firefox, Mail )(Admin: Mail, notes, social)
            Key([mod],"f",lazy.function(app_or_group('3', 'firefox'))),
            Key([mod, "shift"],"f",lazy.function(app_or_group('3', 'firefox-developer-edition'))),
            Key([mod],"t",lazy.function(app_or_group('3', 'tusk'))),
            Key([mod],"g",lazy.function(app_or_group('3', 'mailspring'))),

            ## Group 4 (Code/Write/Office: Atom, typora, onlyofice)
            Key([mod],"o",lazy.function(app_or_group("4", "desktopeditors"))),
            Key([mod, "shift"],"c",lazy.function(app_or_group('4', 'typora'))),
            Key([mod],"a",lazy.function(app_or_group('4', 'atom'))),

            ## Group 5 (Design: Gimp, Inkscape, feh)
            Key([mod],"p",lazy.function(app_or_group('5', 'gimp'))),
            Key([mod, "shift"],"m",lazy.function(app_or_group('5', 'com.github.phase1geo.minder'))),

            ## Group 6 (Virtual Stuff)
            Key([mod],"v",lazy.function(app_or_group('6', 'virtualbox'))),

            ## Group 7 (Música)
            Key([mod],"s",lazy.function(app_or_group('7', 'spotify'))),

            ### Dmenu Run Launcher
            Key([mod], "d",lazy.spawn("rofi -show drun")),]

    for i in groups:
            keys.append(Key([mod], i.name, lazy.group[i.name].toscreen()))
            keys.append(Key([mod, 'shift'], i.name, lazy.window.togroup(i.name)))
    return keys

##### LAYOUTS #####

def init_floating_layout():
    return layout.Floating(border_focus=colors[17])

def init_layout_theme():
    return {"fontsize":14,
            "margin": 10,
           }

def init_border_args():
    return {"border_width": 10
            }

def init_layouts():
    return [#layout.MonadWide(**layout_theme),
            #layout.Bsp(**layout_theme),
            #layout.Stack(stacks=2, **layout_theme),
            #layout.Columns(**layout_theme),
            #layout.RatioTile(**layout_theme),
            #layout.VerticalTile(**layout_theme),
            #layout.Tile(shift_windows=True, **layout_theme),
            #layout.Matrix(single_margin=10,border_normal=colors[16],border_focus=colors[17],**layout_theme),
            #layout.Zoomy(**layout_theme),
            layout.MonadTall(single_margin=10,border_normal=colors[16],border_focus=colors[17],**layout_theme),
            #layout.Max(**layout_theme),
            layout.TreeTab(font = "Fira Code",sections = ["<Treetab/>"],section_fontsize = 15,bg_color = colors[16],active_bg = colors[3],active_fg = colors[16],inactive_bg = colors[17],inactive_fg = colors[16],padding_y = 5,section_top = 10,panel_width = 250,**layout_theme),]
            #layout.Floating(**layout_theme)]

##### WIDGETS #####

def init_widgets_defaults():
    return dict(font="Fira Code",fontsize=14,padding=2,background=colors[16])

def init_widgets_list_top():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list_top = [
                widget.TextBox(text="",background=colors[16],foreground=colors[17],fontshadow=colors[1]),
                widget.TextBox(font="Arial",foreground= colors[3],text="◢",fontsize= 50,padding=0),
                widget.GroupBox(
                        disable_drag=True,
                        hide_unused=True,
                        fontshadow=colors[16],
                        margin_y = 0,
                        margin_x = 0,
                        padding_y = 2,
                        padding_x = 2,
                        borderwidth = 5,
                        active = colors[16], #All groups
                        inactive = colors[2],
                        rounded = False,
                        highlight_method = "block",
                        this_current_screen_border = colors[4],
                        this_screen_border = colors[3],
                        #other_current_screen_border = colors[16],
                        #other_screen_border = colors[16],
                        foreground = colors[16],
                        background = colors[3]
                        ),
                widget.TextBox(font="Arial",foreground= colors[3],text="◤ ",fontsize= 50,padding=-3),
                widget.Notify(default_timeout=10,foreground_low= colors[17],foreground_urgent= colors[9],foreground=colors[17],background = colors[16],fontshadow=colors[1]),
                widget.Sep(linewidth = 0,padding = 5,foreground = colors[17],background=colors[16]),
                widget.WindowName(foreground = colors[17],background = colors[16],padding=5, fontshadow=colors[1]),
                widget.TextBox(font="Arial",foreground= colors[0],background=colors[1],text="◤ ",fontsize=50,padding=-3),
                widget.Systray(icon_size=20,background=colors[1],foreground=colors[16]),
                widget.TextBox(text='◢',background = colors[1],foreground = colors[3],padding=-3,fontsize=65),
                widget.TextBox(text="",padding = 5,foreground=colors[16],background=colors[3],fontshadow=colors[1],fontsize=12),
                widget.CheckUpdates(distro='Arch',colour_have_updates=colors[16],colour_no_updates=colors[16],fontshadow=colors[1],execute='urxvt -e sh -c "sudo pacman -Syu --noconfirm"',foreground=colors[16],background=colors[3]),
                widget.TextBox(font="Arial",text='◢',background=colors[3],foreground=colors[7],padding=-4,fontsize=64),
                widget.Pomodoro(background=colors[7],color_active=colors[16],color_inactive=colors[16],fontshadow=colors[1],color_break=colors[4],length_long_break=15,length_pomodori=45,length_short_break=5,notification_on=True,num_pomodori=2,prefix_inactive='<start/>',prefix_paused='<pause/>'),
                widget.TextBox(font="Arial",text='◢',background=colors[7],foreground=colors[16],padding=-4,fontsize=64),
                widget.TextBox(text=" ",foreground=colors[3],background=colors[16],padding=0,fontshadow=colors[2],fontsize=12),
                widget.Volume(channel='Master',background=colors[16],foreground=colors[17]),
                widget.Sep(linewidth = 0,padding = 5,foreground = colors[17],background = colors[16]),
                widget.Clock(foreground=colors[17],background=colors[16],fontshadow=colors[5],format="[%A, %B %d - %H:%M]"),
              ]
    return widgets_list_top

def init_widgets_list_bot():
    widgets_list_bot = [
                widget.Spacer(length=bar.STRETCH,),
                widget.Prompt(prompt="{0}@{1}: ".format(os.environ["USER"], socket.gethostname())),
                widget.TextBox(font="Arial",text='◢',background=colors[16],foreground=colors[1],padding=-4,fontsize=64),
                widget.TextBox(text="",padding = 5,foreground=colors[16],background=colors[1],fontshadow=colors[17],fontsize=15),
                widget.Mpris2(name='Spotify',objname='org.mpris.MediaPlayer2.spotify',scroll_chars=20,display_metadata=['xesam:artist','xesam:title'],background=colors[1],foreground=colors[16],fontshadow=colors[17],scroll_wait_intervals=0,scroll_interval=0.0,stop_pause_text='<pause/>'),
                widget.TextBox(font="Arial",text="◢",background = colors[1],foreground=colors[2],padding=-1,fontsize=40),
                #widget.Wlan(interface="wlp3s0",foreground=colors[16],background=colors[2],padding=5),
                widget.NetGraph(interface = "enp3s0",foreground=colors[16],background=colors[2],padding=5),
                #widget.NetGraph(interface = "wlp3s0",foreground=colors[16],background=colors[2],padding=5),
                widget.Net(interface = "enp3s0",foreground=colors[16],background=colors[2],padding=5),
                #widget.Net(interface = "wlp3s0",foreground=colors[16],background=colors[2],padding=5),
                widget.TextBox(font="Arial",text="◢",background = colors[2],foreground=colors[6],padding=-1,fontsize=40),
                widget.DF(measure='G',Partition='/',update_interval=60,foreground=colors[16],background=colors[6],padding=5,visible_on_warn=False,),
                widget.TextBox(font="Arial",text="◢",background = colors[6],foreground=colors[7],padding=-1,fontsize=40),
                widget.ThermalSensor(background=colors[7], foreground=colors[16]),
                widget.TextBox(font="Arial",text="◢",background = colors[7],foreground=colors[8],padding=-1,fontsize=40),
                widget.CurrentLayout(background=colors[8],foreground=colors[16]),
                widget.TextBox(font="Arial",text="◢",background = colors[8],foreground=colors[9],padding=-1,fontsize=40),
                widget.CapsNumLockIndicator(foreground=colors[16],background=colors[9],padding=5),
                widget.TextBox(font="Arial",text="◢",background = colors[9],foreground=colors[16],padding=-1,fontsize=40),]
    return widgets_list_bot


##### SCREENS #####

def init_widgets_screen_top():
    widgets_screen_top = init_widgets_list_top()
    return widgets_screen_top
def init_widgets_screen_bot():
    widgets_screen_bot = init_widgets_list_bot()
    return widgets_screen_bot

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen_top(), opacity=0.80, size=20, background=colors[16]),
        bottom=bar.Bar(widgets=init_widgets_screen_bot(), opacity=0.80, size=20, background=colors[16]))]

##### FLOATING WINDOWS #####

@hook.subscribe.client_new
def floating(window):
    floating_types = ['notification', 'toolbar', 'splash', 'dialog','MEGAsync','Gcr-prompter']
    transient = window.window.get_wm_transient_for()
    if window.window.get_wm_type() in floating_types or transient:
        window.floating = True

def init_mouse():
    return [Drag([mod], "Button1", lazy.window.set_position_floating(),      # Move floating windows
                 start=lazy.window.get_position()),
            Drag([mod], "Button3", lazy.window.set_size_floating(),          # Resize floating windows
                 start=lazy.window.get_size()),
            Click([mod, "shift"], "Button1", lazy.window.bring_to_front())]  # Bring floating window to front

##### DEFINING A FEW THINGS #####

if __name__ in ["config", "__main__"]:
    mod = "mod4"
    alt = "mod1"                                   # Sets mod key to SUPER/WINDOWS
    myTerm = "urxvt"                                  # Terminal
    myConfig = "/home/gibranlp/.config/qtile/config.py"    # Qtile config file location

    colors = init_colors()
    keys = init_keys()
    mouse = init_mouse()
    #group_names = init_group_names()
    #groups = init_groups()
    floating_layout = init_floating_layout()
    layout_theme = init_layout_theme()
    border_args = init_border_args()
    layouts = init_layouts()
    screens = init_screens()
    widget_defaults = init_widgets_defaults()
    widgets_list_top = init_widgets_list_top()
    widgets_list_bot = init_widgets_list_bot()
    widgets_screen_top = init_widgets_screen_top()
    widgets_screen_bot = init_widgets_screen_bot()


##### SETS GROUPS KEYBINDINGS #####



##### STARTUP APPLICATIONS #####

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

##### NEEDED FOR SOME JAVA APPS #####

#wmname = "LG3D"
wmname = "qtile"
