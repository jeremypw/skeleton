# Skeleton

A skeleton application only creating an application window but including the infrastructure for translations, icons and
resources.
## Building and Installation

You'll need the following dependencies:
* glib-2.0
* gobject-2.0
* libgranite-7-dev >= 7.0.0
* gtk4
* libadwaita-1-dev >= 1.0.0
* meson
* valac
* flatpak-builder

Run in a terminal from the source root the folling command:

 `flatpak-builder --force-clean --install --user com.github.jeremypw.skeleton` 
