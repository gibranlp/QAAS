import subprocess
import os
import optparse

img_path = ('/home/gibranlp/MEGA/wallPapers/')

def get_arguments():
    parser = optparse.OptionParser()
    parser.add_option("-w", "--wall", dest="img", help="Image to set the wallpaper")
    parser.add_option("-l", "--light", dest="light", help="Select light scheme")
    (options, arguments) = parser.parse_args()
    if not options.img:
        parser.error("[-] Please specify an image to set the wallpaper or type -help for more info.")
    return options
    #if options.light


def change_colors(img):
    print("[+] Changing wallpaper & Colors...")
    subprocess.call("wal -i" + img_path + img + " -a 85 -q ", shell=True)
    subprocess.call("qtile-cmd -o cmd -f restart", shell=True)
    print("[=] Done...")

options=get_arguments()
change_colors(options.img)
