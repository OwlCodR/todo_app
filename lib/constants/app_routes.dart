enum AppRoutes {
  unknownRoute('/unknown'),
  tasksListRoute('/'),
  newTaskEditorRoute('/new'),
  taskEditorRoute('/editor');

  const AppRoutes(this.name);

  final String name;
}
