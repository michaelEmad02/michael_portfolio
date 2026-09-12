import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/storage_service.dart';
import '../services/url_launcher_service.dart';
import '../localization/cubit/locale_cubit.dart';
import '../../shared/state/theme_cubit.dart';
import '../../features/projects/domain/repositories/project_repository.dart';
import '../../features/projects/data/datasources/projects_local_data_source.dart';
import '../../features/projects/data/repositories/project_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Core Services
  sl.registerLazySingleton<StorageService>(() => StorageServiceImpl(sl()));
  sl.registerLazySingleton<UrlLauncherService>(() => UrlLauncherServiceImpl());

  // State Management (Cubits)
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit(sl()));
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit(sl()));

  // Features: Projects
  sl.registerLazySingleton<ProjectsLocalDataSource>(() => ProjectsLocalDataSourceImpl());
  sl.registerLazySingleton<ProjectRepository>(() => ProjectRepositoryImpl(sl()));
}
