#Translate and install our .desktop file
i18n.merge_file(
    input: 'app.desktop.in',
    output: meson.project_name() + '.desktop',
    po_dir: meson.source_root() / 'po',
    type: 'desktop',
    install: true,
    install_dir: get_option('datadir') / 'applications'
)

#Translate and install our .metainfo file
i18n.merge_file(
    input: 'app.metainfo.xml.in',
    output: meson.project_name() + '.metainfo.xml',
    po_dir: meson.source_root() / 'po',
    type: 'xml',
    install: true,
    install_dir: get_option('datadir') / 'metainfo'
)

## Uncomment this section if providing an installed application icon.
# icon_sizes = ['16', '24', '32', '48', '64', '128']

# foreach i : icon_sizes
#     install_data(
#         join_paths('icons', i + '.svg'),
#         install_dir: join_paths(get_option('datadir'), 'icons', 'hicolor', i + 'x' + i, 'apps'),
#         rename: meson.project_name() + '.svg'
#     )
#     install_data(
#         join_paths('icons', i + '.svg'),
#         install_dir: join_paths(get_option('datadir'), 'icons', 'hicolor', i + 'x' + i + '@2', 'apps'),
#         rename: meson.project_name() + '.svg'
#     )
# endforeach

# Un comment this section if providing persistent settings
install_data(
    'gschema.xml',
    install_dir: get_option('datadir') / 'glib-2.0' / 'schemas',
    rename: meson.project_name() + '.gschema.xml'
)

