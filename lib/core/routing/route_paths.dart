class RoutePaths {
  const RoutePaths._();

  static const String home = '/';
  static const String projectDetails = '/project/:id';

  static String projectDetailsWithId(String id) => '/project/$id';
}
