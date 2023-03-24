# Dotfiles Linux Edition

My dotfiles for my riced up Pop_OS! Machine

Amazing writing capabilities too with vim Pencil+Goyo.


## Tips & Tricks

### How to force hiDPI scaling on boot on Pop_OS! - [Link](https://unix.stackexchange.com/questions/530748/how-to-force-hidpi-scaling-mode-on-boot-in-pop-os-gnome)

If you have a 4k display even though Pop_OS! is good with hiDPI once logged in, the log screen is way too small... This addresses that problem.

Go to: `/usr/share/glib-2.0/schemas/org.gnome.desktop.interface.gschema.xml`

Change the default value:

```xml
<key name="scaling-factor" type="u">
<default>2</default>
```

Apply Changes:

```sh
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
```

### Installing Davinci Resolve Studio on Arch

First install with `yay`

```sh
yay -S davinci-resolve-studio
```

Then for the first time you'll need to launch the app as super user

```sh
sudo /opt/resolve/bin/resolve
```

That way you'll be able to input the activation code and the app will work normally from that point forward without sudo


## Keyboard with accents

Alt+a = á

```sh
localectl --no-convert set-x11-keymap us "" altgr-intl
```
