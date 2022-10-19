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

        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 12);
        var label1 = new Gtk.Label (_("Translatable label")) {
          vexpand = true,
          valign = Gtk.Align.CENTER
        };
        box.append (label1);

        // var settings = new Settings ("com.github.jeremypw.skeleton");
        // var settings_label_s = settings.get_string ("settings-label");
        // var label2 = new Gtk.Label (settings_label_s) {
        //   valign = Gtk.Align.CENTER
        // };
        // box.append (label2);

        main_window.child = box;
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
