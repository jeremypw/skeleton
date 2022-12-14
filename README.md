# Skeleton

A skeleton application only creating an application window but including the infrastructure for translations, icons and resources.

## Creating an app based on this skeleton
Create and initialise an empty `git` root directory with the command `git init -b [BRANCH] [NAME OF ROOT]`.  If `-b [BRANCH]` is not specified then the default (usually `master`) will be created. In the root directory run the command:
```
git pull https://github.com/jeremypw/skeleton.github main
```

## Changing the name of the project
Replace `com.github.jeremypw.skeleton` with a unique project name wherever it occurs in the source code, in the name of the Flatpak manifest (`.yaml` file).  Remove and regenerate the `.pot` and `.po` files according to instructions below. In the instructions below the new project name is represented by `[PROJECTNAME]`.
Commit changes to git.

## Dependencies
You'll need the following dependencies to build the project:
* glib-2.0
* gobject-2.0
* libgranite-7-dev >= 7.0.0
* gtk4
* libadwaita-1-dev >= 1.0.0
* meson
* valac
* flatpak-builder

## Translations
In order to implement internationalization the following steps are needed:
* Add language codes in `/po/LINGUAS/`  (the skeleton contains two example codes)
* Add/replace/remove paths of source files containing translatable strings to `/po/POTFILES`
* Run in a terminal from the source root the following command:
```
    meson build --prefix=/usr
    cd build
    meson compile [PROJECTNAME]-pot
    meson compile [PROJECTNAME]-update-po
```
The above steps (apart from creating the build directory) should be repeated whenever new languages or translatable files or strings are added.

## Application icon
If you are providing an installed application icon then uncomment the commented out section in `data/meson.build` and provide the necessary `.svg` files.
The commented out section assumes the icons will be provided in an `icon` subdirectory of `data` and be named with the form `NN.svg` where `NN` is the pixel size (`16.svg`, `24.svg` ... etc).

## Custom Icons and CSS
If you require custom (uninstalled) icons or style sheets loaded from a gresource then modify `data/gresource.xml` with the source path of the icons and CSS.
This file contains commented out template for such declarations. Create the necessary `.svg` and `.css` files in the data directory.

## Settings
If you require persistent settings using GSettings in your app
* Uncomment the line that runs `post_install.py` in `/meson.build`
* Uncomment the section that installs `gschema.xml` in `data/meson.build`
* Modify `data/gschema.xml` to add the required keys, enums etc
* Create a `settings` object in the `activate` function of `Application.vala` to access the settings keys

## Build and install Flatpak
Run in a terminal from the source root the following command: 

 `flatpak-builder --force-clean --install --user [BUILD_DIR] [PROJECTNAME].yaml`
 
Replace `[BUILD_DIR]` with the path of an empty folder (NOT the project root) in which to build the project. 
**NOTE**: The contents of the build directory will be erased before building.

See https://docs.github.com/en/get-started/importing-your-projects-to-github/importing-source-code-to-github/adding-locally-hosted-code-to-github for information of how to host your new app on GitHub (other hosts are available).

Start changing the source code!
