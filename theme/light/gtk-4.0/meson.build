theme_gtk4_light_conf = configuration_data()
theme_gtk4_light_conf.merge_from(conf_data)
theme_gtk4_light_conf.set('VARIANT', 'light')

theme_gtk4_light_scss = configure_file(input: join_paths(meson.project_source_root(), 'gtk4', 'styling', 'theme.scss.in'),
  output: 'gtk.scss',
  configuration: theme_gtk4_light_conf)

theme_gtk4_light = custom_target('theme-gtk4-default',
  depends: [adwaita_styles],
  output: 'gtk.css',
  input: theme_gtk4_light_scss,
  build_always: true,
  build_by_default: true,
  command: [sass, '@INPUT@', '@OUTPUT@', sass_flags],
  install: true,
  install_dir: join_paths(datadir, 'themes', 'Tokyo-Night-Light', 'gtk-4.0'))

foreach asset : adwaita_assets
  asset_name = fs.name(asset.full_path())

  custom_target('theme-gtk4-default-asset-@0@'.format(asset_name),
    input: asset,
    output: asset_name,
    command: ['cp', '@INPUT@', '@OUTPUT@'],
    install: true,
    install_dir: join_paths(datadir, 'themes', 'Tokyo-Night-Light', 'gtk-4.0', 'assets'))
endforeach
