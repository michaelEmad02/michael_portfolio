import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository.dart';
import '../datasources/projects_local_data_source.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectsLocalDataSource _localDataSource;

  ProjectRepositoryImpl(this._localDataSource);

  @override
  List<ProjectEntity> getProjects() => _localDataSource.getProjects();

  @override
  ProjectEntity? getProjectById(String id) => _localDataSource.getProjectById(id);
}
