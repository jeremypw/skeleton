project(
    'com.github.jeremypw.skeleton', 'vala', 'c',
    meson_version: '>= 0.49',
    version: '1.0.0'
)

gnome = import('gnome')
i18n = import('i18n')

add_project_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

gresource = gnome.compile_resources(
    'gresource',
    join_paths('data', 'gresource.xml'),
    source_dir: 'data'
)

config_data = configuration_data()
config_data.set_quoted('LOCALEDIR', get_option('prefix') / get_option('localedir'))
config_data.set_quoted('GETTEXT_PACKAGE', meson.project_name())
config_file = configure_file(
    input: 'src/Config.vala.in',
    output: '@BASENAME@',
    configuration: config_data
)

libecal_dep = dependency('libecal-2.0')

deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('granite-7', version: '>=7.0.0'),
    dependency('gtk4'),
    dependency('libadwaita-1', version: '>=1.0.0'),
]

executable(
    meson.project_name(),
    config_file,
    gresource,
    'src/Application.vala',
    dependencies: deps,
    install : true
)

subdir('data')
subdir('po')

