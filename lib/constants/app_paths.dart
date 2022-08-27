enum AppPaths {
  checked('assets/images/checked.svg'),
  unchecked('assets/images/unchecked.svg'),
  info('assets/images/info.svg'),
  uncheckedImportant('assets/images/unchecked_important.svg'),
  prefixImportnantPriority('assets/images/prefix_important_priority.svg'),
  prefixLowPriority('assets/images/prefix_low_priority.svg');

  const AppPaths(this.path);
  final String path;
}
