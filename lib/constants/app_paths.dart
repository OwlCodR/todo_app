enum AppPaths {
  checked('assets/images/checked.svg'),
  checkedDark('assets/images/checked_dark.svg'),
  unchecked('assets/images/unchecked.svg'),
  uncheckedDark('assets/images/unchecked_dark.svg'),
  info('assets/images/info.svg'),
  uncheckedImportant('assets/images/unchecked_important.svg'),
  uncheckedImportantDark('assets/images/unchecked_important_dark.svg'),
  prefixImportnantPriority('assets/images/prefix_important_priority.svg'),
  prefixImportnantPriorityDark('assets/images/prefix_important_priority_dark.svg'),
  prefixLowPriority('assets/images/prefix_low_priority.svg');

  const AppPaths(this.path);
  final String path;
}
