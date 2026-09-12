class AppConstants {
  const AppConstants._();

  static const String appName = 'Michael Emad Portfolio';
  static const String developerName = 'Michael Emad';
  static const String developerRole = 'Flutter Developer';
  static const String email = 'michael.emad.jc@gmail.com';
  static const String phone = '+201157805417';
  static const String whatsappNumber = '201157805417';
  static const String location = 'Egypt';

  // Profile Image URL (loaded from internet with local asset fallback)
  static const String profileImageUrl =
      'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789214648/me.webp';
  static const String profileAssetPath = 'assets/images/michael_emad.jpg';

  // Storage Keys
  static const String themeStorageKey = 'app_theme_mode';
  static const String localeStorageKey = 'app_locale_code';

  // Code Snippet for Hero Visual
  static const String heroCodeSnippet = '''// Clean Architecture + BLoC + DI
class MichaelEmad implements FlutterEngineer {
  final CleanArchitecture architecture;
  final StateManagement state = BlocCubit();
  final BackendServices backend = SupabaseWithFirebase();

  @override
  Future<App> deliverQualitySoftware() async {
    return App.scalable(
      responsive: true,
      highPerformance: 60.fps,
      cleanCode: true,
    );
  }
}''';
}
