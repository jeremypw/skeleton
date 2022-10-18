# Skeleton

A skeleton application only creating an application window but including the infrastructure for translations, icons and resources.

## Changing the name of the project
Replace `com.github.jeremypw.skeleton` with a unique project name wherever it occurs in the source code and in the name of the Flatpak manifest (`.yaml` file). In the instructions below the new project name is represented by `[PROJECTNAME]`.

## Dependencies
You'll need the following dependencies:
* glib-2.0
* gobject-2.0
* libgranite-7-dev >= 7.0.0
* gtk4
* libadwaita-1-dev >= 1.0.0
* meson
* valac
* flatpak-builder

## Translations
* Add/replace/remove language codes in `/po/LINGUAS/`  (the skeleton contains two example codes)
* Add/replace/remove paths of source files containing translatable strings to `/po/POTFILES`
* Run in a terminal from the source root the following command:
```
    meson build --prefix=/usr
    cd build
    meson compile [PROJECTNAME]-pot
    meson compile [PROJECTNAME]-update-po
```

## Build and install Flatpak
Run in a terminal from the source root the following command: 

 `flatpak-builder --force-clean --install --user [BUILD_DIR] [PROJECTNAME].yaml`
 
Replace `[BUILD_DIR]` with the path of an empty folder (NOT the project root) in which to build the project. 
**NOTE**: The contents of the build directory will be erased before building.


