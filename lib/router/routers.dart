enum Routers {
  root('/', 'splash'),
  intro('/intro', 'intro'),
  home('/home', 'home'),
  notFound('/notFound', 'notFound');

  final String routerPath;  // Path to navigate to
  final String routerName;  // Human - readable name used internally for identification

  const Routers(this.routerPath, this.routerName);
}