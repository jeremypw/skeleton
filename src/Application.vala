/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2021 Your Name <you@email.com>
 */

public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.jeremypw.Skeleton",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = _("Hello World")
        };

        var label = new Gtk.Label (_("Translatable label"));
        main_window.child = label;
        main_window.present ();
    }

    public static int main (string[] args) {
        GLib.Intl.setlocale (LocaleCategory.ALL, "");
        GLib.Intl.bindtextdomain (Constants.GETTEXT_PACKAGE, Constants.LOCALEDIR);
        GLib.Intl.bind_textdomain_codeset (Constants.GETTEXT_PACKAGE, "UTF-8");
        GLib.Intl.textdomain (Constants.GETTEXT_PACKAGE);

        return new MyApp ().run (args);
    }
}
