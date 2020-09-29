import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';

abstract class DeleteTask {
  Future<Either<String, int>> deleteTask(int id);
}

class DeleteTaskImpl implements DeleteTask {
  final TaskRepositoryImpl repository;

  DeleteTaskImpl(this.repository);

  @override
  Future<Either<String, int>> deleteTask(int ids) async {
    final result = await repository.deleteTask(ids);
    var response = result.fold(id, id);
    if (response is String) {
      return Left(response);
    }
    return Right(response);
  }
}
