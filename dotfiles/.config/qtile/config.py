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
from libqtile.config import Key, Screen, Group, Match, Drag, Click, Rule
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import Spacer
import subprocess
import json

##### Startup apps / Aplicaciones al Inicio #####
home = os.path.expanduser('~')
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.startup
def start():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/alwaystart.sh'])

@hook.subscribe.screen_change
def restart_on_randr(qtile, ev):
	qtile.cmd_restart()


##### Import Pywal Palette / Importar la paleta generada por pywal #####
with open(home + '/.cache/wal/colors.json') as json_file:
    data = json.load(json_file)
    colorsarray = data['colors']
    val_list = list(colorsarray.values())
    def getList(val_list):
        return [*val_list]

def init_colors():
    return [*val_list]

## Import Network interface / Importar la tarjeta de red en uso ####

with open(home + '/.config/qtile/actnet', 'r') as file:
    netact = file.read().replace('\n', '')

##### Window Functions / Funciones de las ventanas #####

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

##### Specific Apps/Groups / Apps/Grupos especificos #####

def app_or_group(group, app):
    def f(qtile):
        if qtile.groups_map[group].windows:
            qtile.cmd_spawn(app)
        else:
            qtile.groups_map[group].cmd_toscreen()
            qtile.cmd_spawn(app)
    return f

#### Shortcuts  ####

def init_keys():
    keys = [           
            Key([mod], "q",lazy.window.kill()), # Kill Window / Cerrar ventana
            Key([mod, "shift"], "r",lazy.restart()), # Restart Qtile / Reiniciar Qtile
            Key([mod, "shift"], "q",lazy.shutdown()), # Logout / Cerrar sesión
            Key([mod], "Escape", lazy.spawn('xkill')), # Select window with mouse to kill / Cerrar ventana con el raton
            Key([mod], "w",lazy.spawn('rand')),
            Key([alt], "w",lazy.spawn('randw')), # Random Wallpaper / Papel tapiz aleatorio

            ####  ####
            Key([mod], "Tab",lazy.layout.down()), # Change focus of windows down
            Key([mod, "shift"], "Tab",lazy.layout.up()), # Change focus of windows up
            Key([alt], "Tab", lazy.layout.swap_left()),
            Key([alt, "shift"], "Tab", lazy.layout.swap_right()),
            Key([mod], "h", lazy.layout.left()),
            Key([mod], "l", lazy.layout.right()),
            Key([mod], "Up", lazy.layout.down()),
            Key([mod], "Down", lazy.layout.up()),

            #### Brightness
            Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
            Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),

            #### Volume
            Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
            Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
            Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),

            #### Media Control
            #Key([mod], "v", lazy.spawn('/home/gibranlp/MEGA/computerStuff/keyboard/keyboard_activate.sh')),
            #Key([mod], "b", lazy.spawn('/home/gibranlp/MEGA/computerStuff/keyboard/keyboard_deactivate.sh')),
            Key([], "XF86AudioPlay", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")),
            Key([], "XF86AudioNext", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")),
            Key([], "XF86AudioPrev", lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")),
            Key([], "XF86AudioStop", lazy.spawn("cmus-remote --stop")),

            ### Window hotkeys
            Key([alt], "f", lazy.window.toggle_fullscreen()),
            Key([alt, "shift"], "f", lazy.window.toggle_floating()),
            Key([mod], "space", lazy.next_layout()),

            # Resize windows
            Key([mod, "shift"], "Up", lazy.layout.grow()),
            Key([mod, "shift"], "Down", lazy.layout.shrink()),
            Key([mod, "shift"], "space", lazy.layout.flip()),

            # Change focus
            Key([mod], "Up", lazy.layout.up()),
            Key([mod], "Down", lazy.layout.down()),
            Key([mod], "Left", lazy.layout.left()),
            Key([mod], "Right", lazy.layout.right()),

            ### Screenshots
            Key([], "Print", lazy.spawn("scrot -e 'Archlp-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'")),

            ##### GROUPS (DESKTOPS) #####

            ## Group 1 (Tools, )
            Key([mod], "Return", lazy.spawn(myTerm)),
            Key([mod],"e",lazy.spawn('urxvt -e ranger')),
            #Key([mod],"e",lazy.function(app_or_group("1", "thunar"))),
            Key([mod, "shift"],"a",lazy.function(app_or_group("1", "anydesk"))),
             Key([mod, "shift"],"s",lazy.function(app_or_group('1', 'simplenote'))),

            ## Group 2 (Organization)
            Key([mod],"m",lazy.function(app_or_group('2', 'mailspring'))),
           

            ## Group 2 (Social: Whatsapp, Telegram, )
            Key([mod, "shift"],"w",lazy.function(app_or_group('3', 'whatsdesk'))),
            Key([mod, "shift"],"t",lazy.function(app_or_group('3', 'telegram-desktop'))),
            Key([mod, "shift"],"d",lazy.function(app_or_group('3', 'discord'))),


            ## Group 3 (WEB: Firefox)(Admin: Mail, notes, social)
            Key([mod],"f",lazy.function(app_or_group('4', 'firefox'))),
            Key([mod, "shift"],"f",lazy.spawn('wsearch')),


            ## Group 4 (Code/Write/Office: visual studio, typora, onlyofice)
            Key([mod],"o",lazy.function(app_or_group("6", 'libreoffice'))),
            Key([mod],"c",lazy.function(app_or_group('5', 'code'))),

            ## Group 5 (Design: Gimp, Inkscape, feh)
            Key([mod],"g",lazy.function(app_or_group('6', 'gimp'))),
            Key([mod, "shift"],"m",lazy.function(app_or_group('6', 'com.github.phase1geo.minder'))),

            ## Group 6 (Virtual Stuff games)
            Key([mod],"v",lazy.function(app_or_group('8', 'virtualbox'))),
            Key([mod],"b",lazy.function(app_or_group('8', '/home/gibranlp/albiononline/./Albion-Online'))),

            ## Group 7 (Música)
            Key([mod],"s",lazy.function(app_or_group('7', 'spotify'))),

            ### Dmenu Run Launcher
            Key([mod], "d",lazy.spawn("rofi -theme '~/.cache/wal/colors-rofi-dark.rasi' -show run")),]

    for i in groups:
            keys.append(Key([mod], i.name, lazy.group[i.name].toscreen()))
            keys.append(Key([mod, 'shift'], i.name, lazy.window.togroup(i.name)))
    return keys


##### GROUPS #####

groups = [
    Group("1",position=1,matches=[Match(wm_class=['thunar', 'Thunar', 'gnome-disks', 'Gnome-disks', 'anydesk', 'Simplenote', 'Anydesk'])],layout="matrix",label=""),
    Group("2",position=2,matches=[Match(wm_class=['Zoom','zoom', 'Mailspring', 'mailspring', 'transmission-gtk','Transmission-gtk'])],layout="monadtall",label=""),
    Group("3",position=3,matches=[Match(wm_class=['whatsdesk','telegram-desktop-bin', 'TelegramDesktop', 'Discord', 'discord'])],layout="monadtall",label=""),
    Group("4",position=4,matches=[Match(wm_class=['firefox'])],layout="monadtall",label=""),
    Group("5",position=5,matches=[Match(wm_class=['Code', 'code','Filezilla'])],layout="monadtall",label=""),
    Group("6",position=6,matches=[Match(wm_class=['Gimp-2.10','Inkscape','Evince', 'libreoffice','Com.github.phase1geo.minder'])],layout="monadtall",label=""),
    Group("7",position=7,matches=[Match(wm_class=['Spotify','spotify'])],layout="monadtall",label=""),
    Group("8",position=8,matches=[Match(wm_class=['VirtualBox Manager', 'VirtualBox Machine', 'Albion Online Launcher'])],layout="monadtall",label=""),
    Group("9",position=9,layout="monadtall",label="")]

    
##### LAYOUTS #####

def init_floating_layout():
    return layout.Floating(border_normal=colors[0], border_focus=colors[7])

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
            #layout.Matrix(single_margin=10,border_normal=colors[0],border_focus=colors[7],**layout_theme),
            #layout.Zoomy(**layout_theme),
            layout.MonadTall(max_ratio=0.60,single_margin=0, single_border_width=0,ratio=0.8, border_normal=colors[0], border_focus=colors[7], **layout_theme),
            #layout.Max(**layout_theme),
            layout.TreeTab(font="Fira Code Medium",sections=["Tabs"],section_fontsize=14, bg_color=colors[0], active_bg=colors[7], active_fg=colors[0], inactive_bg=colors[0], inactive_fg=colors[7],padding_y=5,panel_width=250, **layout_theme)]
            #layout.Floating(border_normal=colors[0], border_focus=colors[7],**layout_theme)]

##### WIDGETS #####

def init_widgets_defaults():
    return dict(font="Fira Code Medium",fontsize=16,padding=2,background=colors[0])

def netw(qtile):
    qtile.cmd_spawn('network')

def htop(qtile):
    qtile.cmd_spawn('urxvt -e htop')

def rangercli(qtile):
    qtile.cmd_spawn('urxvt -e ranger')

def init_widgets_list_top():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list_top = [
                widget.TextBox(font='Font Awesome 5 Free',fontsize=14,foreground=colors[7],text=""),
                widget.TextBox(foreground=colors[1],text="   ◢",fontsize=45,padding=-2),
                widget.GroupBox(font='Font Awesome 5 Free',fontsize=14, disable_drag=True, hide_unused=False, fontshadow=colors[0], margin_y=1, padding_x=5, borderwidth=0, active=colors[7],  inactive=colors[1], rounded=False, highlight_method="text", this_current_screen_border=colors[0], this_screen_border=colors[3], other_current_screen_border=colors[0], other_screen_border=colors[0], foreground=colors[2], background=colors[1]),
                
                widget.TextBox(background=colors[0],foreground=colors[1],text="◤ ",fontsize=45,padding=-2),
                widget.Notify(font='Font Awesome 5 Free',fontsize=15,fmt=" ",default_timeout=15, foreground=colors[3], background=colors[0], fontshadow=colors[2]),
                widget.Notify(default_timeout=15, foreground_low=colors[3],foreground_urgent=colors[6], foreground=colors[7], background=colors[0]),
                widget.Notify(font='Font Awesome 5 Free',fontsize=15,fmt="",default_timeout=15, foreground=colors[3], background=colors[0], fontshadow=colors[2]),
                widget.Spacer(length=bar.STRETCH,),
                
                widget.TextBox(text="◢", background=colors[0], foreground=colors[6], padding=-2, fontsize=45),
                ##### Network Interfaces ####
                widget.Wlan(font='Font Awesome 5 Free',fontsize=15,interface=netact, format='', foreground=colors[0], background=colors[6], fontshadow=colors[7],mouse_callbacks={'Button1':netw}),
                widget.Wlan(interface=netact, format='{essid} {percent:2.0%}', disconnected_message='Unplugged', foreground=colors[0], background=colors[6], mouse_callbacks={'Button1':netw}),
                widget.TextBox(text="◢", background=colors[6], foreground=colors[2], padding=-2, fontsize=45),
                widget.Net(font='Font Awesome 5 Free',fontsize=15,interface=netact, format='↓', foreground=colors[0], background=colors[2], fontshadow=colors[7], use_bits=True, mouse_callbacks={'Button1':netw}),
                widget.Net(interface=netact, format='{down}', foreground=colors[0], background=colors[2], use_bits=True, mouse_callbacks={'Button1':netw}),
                widget.Net(font='Font Awesome 5 Free',fontsize=15,interface=netact, format='↑', foreground=colors[0], background=colors[2], fontshadow=colors[7], use_bits=True, mouse_callbacks={'Button1':netw}),
                widget.Net(interface=netact, format='{up}', foreground=colors[0], background=colors[2], use_bits=True, mouse_callbacks={'Button1':netw}),
                widget.TextBox(text='◢', background=colors[2], foreground=colors[3], padding=-2,fontsize=45),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=15,background=colors[3],foreground=colors[0],text=""),
                widget.Pomodoro(background=colors[3], foreground=colors[0], color_active=colors[0], color_break=colors[2], color_inactive=colors[0], length_pomodori=50, length_short_break= 5, length_long_break=15,
                num_pomodori=3, prefix_break='Break',  prefix_inactive='start', prefix_long_break='Long Break', prefix_paused='' ),
                widget.TextBox(text='◢', background=colors[3], foreground=colors[7], padding=-2,fontsize=45),
                #### Battery for laptops ####
                widget.TextBox(font='Font Awesome 5 Free',text="", padding=5, foreground=colors[0], background=colors[7], fontshadow=colors[7], fontsize=14),
                widget.KhalCalendar(lookahead=15, remindertime=60, foreground=colors[0], background=colors[7]),
                #widget.Battery(show_short_text=False, notify_below=30, charge_char=' ', discharge_char=' ', empty_char='', full_char=' ',background=colors[7], foreground=colors[0],format='{char}{percent:2.0%}', update_interval=5),
                widget.TextBox(text='◢', background=colors[7], foreground=colors[0], padding=-2,fontsize=45),
                widget.TextBox(font='Font Awesome 5 Free',text=" ", foreground=colors[7], background=colors[0], padding=0, fontshadow=colors[4], fontsize=15),
                widget.Volume(channel='Master', background=colors[0], foreground=colors[7], fontshadow=colors[2]),
                widget.Sep(linewidth=0,padding=5, foreground=colors[7], background = colors[0]),
                widget.Systray(icon_size=20, background=colors[0], foreground=colors[0]),
                widget.Clock(foreground=colors[7], background=colors[0], format="%b%a %d|%H:%M", update_interval=1),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=14,foreground=colors[7],text=""),
              ]
    return widgets_list_top

def init_widgets_list_bot():
    widgets_list_bot = [
                widget.DebugInfo(foreground=colors[7], background=colors[0], fontshadow=colors[2]),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=15,foreground=colors[7],fontshadow=colors[4],text=""),
                widget.WindowName(foreground=colors[7], background=colors[0], padding=5),
                widget.Spacer(length=bar.STRETCH,),
                #widget.TextBox(text="◢",background=colors[0], foreground=colors[1], padding=-2, fontsize=45),
                #widget.YahooWeather(background=colors[1], foreground=colors[0], metric=True, update_interval=600, format='{location_city}: {condition_temp} °{units_temperature}', woeid='136973'),
                widget.TextBox(text='◢',background=colors[0],foreground=colors[6],padding=-2,fontsize=45),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=15,text="", padding=5, foreground=colors[0], background=colors[6], fontshadow=colors[7]),
                widget.Mpris2(name='spotify', objname='org.mpris.MediaPlayer2.spotify', scroll_chars=50, display_metadata=['xesam:artist','xesam:title'], background=colors[6], foreground=colors[0], scroll_interval=0.5, scroll_wait_intervals=500),
                widget.TextBox(text="◢",background=colors[6], foreground=colors[2], padding=-2, fontsize=45),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=14,background=colors[2], foreground=colors[0],fontshadow=colors[7],text=""),
                widget.Memory(format='RAM {MemUsed}Mb',border_color=colors[0], graph_color=colors[0], foreground=colors[0], background=colors[2], padding=5),
                widget.TextBox(text="◢",background=colors[2], foreground=colors[5], padding=-2, fontsize=45),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=14,background=colors[5], foreground=colors[0],text="",fontshadow=colors[7]),
                widget.CPU(format='CPU {load_percent}%',border_color=colors[0], graph_color=colors[0], foreground=colors[0], background=colors[5], mouse_callbacks={'Button1': htop}),
                widget.CPUGraph(type='linefill', fill_color=colors[7], border_color=colors[0], graph_color=colors[0], foreground=colors[0], background=colors[5], padding=5, mouse_callbacks={'Button1': htop}),
                widget.TextBox(text="◢", background=colors[5], foreground=colors[3], padding=-2, fontsize=45),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=14,background=colors[3], foreground=colors[0],fontshadow=colors[7],text=""),
                widget.DF(format='{p} ({uf}{m}|{r:.0f}%)', measure='G', Partition='/', update_interval=60, foreground=colors[0], background=colors[3], padding=5, visible_on_warn=False,mouse_callbacks={'Button1':rangercli}),
                widget.TextBox(text="◢",background = colors[3],foreground=colors[7],padding=-2,fontsize=45),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=14,background=colors[7], foreground=colors[0],fontshadow=colors[7],text=""),
                widget.CurrentLayout(background=colors[7],foreground=colors[0], fontshadow=colors[7]),
                widget.TextBox(text="◢",background = colors[7],foreground=colors[0],padding=-2,fontsize=45),
                widget.TextBox(font='Font Awesome 5 Free',fontsize=17,text="",foreground=colors[7],background=colors[0]),
                widget.KeyboardLayout(foreground=colors[7],background=colors[0],padding=5, fontshadow=colors[4]),
                widget.CapsNumLockIndicator(foreground=colors[7],background=colors[0],padding=5),]
    return widgets_list_bot


##### SCREENS #####

def init_widgets_top():
    widgets_screen_top = init_widgets_list_top()
    return widgets_screen_top
def init_widgets_bot():
    widgets_screen_bot = init_widgets_list_bot()
    return widgets_screen_bot

def init_screens():
    return [
        Screen(top=bar.Bar(widgets=init_widgets_top(),  size=20, background=colors[0]),
        bottom=bar.Bar(widgets=init_widgets_bot(), size=20, background=colors[0])),
        Screen(top=bar.Bar(widgets=init_widgets_top(),  size=20, background=colors[0]),
        bottom=bar.Bar(widgets=init_widgets_bot(), size=20, background=colors[0]))
        ]

##### FLOATING WINDOWS #####

@hook.subscribe.client_new
def floating(window):
    floating_types = ['notification', 'toolbar', 'splash', 'dialog','Nextcloud','Gcr-prompter']
    transient = window.window.get_wm_transient_for()
    if window.window.get_wm_type() in floating_types or transient:
        window.floating = True

def init_mouse():
    return [Drag([mod], "Button1", lazy.window.set_position_floating(),      # Move floating windows
                 start=lazy.window.get_position()),
            Drag([mod], "Button2", lazy.window.set_size_floating(),          # Resize floating windows
                 start=lazy.window.get_size()),
            Click([mod, "shift"], "Button1", lazy.window.bring_to_front())]  # Bring floating window to front

##### DEFINING A FEW THINGS #####

if __name__ in ["config", "__main__"]:
    mod = "mod4"
    alt = "mod1"                                   # Sets mod key to SUPER/WINDOWS
    myTerm = "urxvt"                                  # Terminal
    myConfig = home + '/.config/qtile/config.py'    # Qtile config file location

    colors = init_colors()
    keys = init_keys()
    mouse = init_mouse()
    #group_names = init_group_names()
    #groups = init_groups()
    floating_layout = layout.Floating(float_rules=[
        {'wmclass': 'confirm'},
        {'wmclass': 'dialog'},
        {'wmclass': 'download'},
        {'wmclass': 'error'},
        {'wmclass': 'file_progress'},
        {'wmclass': 'notification'},
        {'wmclass': 'splash'},
        {'wmclass': 'toolbar'},
        {'wmclass': 'confirmreset'},  # gitk
        {'wmclass': 'makebranch'},  # gitk
        {'wmclass': 'maketag'},  # gitk
        {'wname': 'branchdialog'},  # gitk
        {'wname': 'pinentry'},  # GPG key password entry
        {'wmclass': 'ssh-askpass'},
        {'wmclass': 'oblogout'},
        {'wmclass': 'Oblogout'},  # ssh-askpass
    ])
    layout_theme = init_layout_theme()
    border_args = init_border_args()
    layouts = init_layouts()
    screens = init_screens()
    widget_defaults = init_widgets_defaults()
    widgets_list_top = init_widgets_list_top()
    widgets_list_bot = init_widgets_list_bot()
    widgets_screen_top = init_widgets_top()
    widgets_screen_bot = init_widgets_bot()
#wmname = "LG3D"
wmname = "qtile"
