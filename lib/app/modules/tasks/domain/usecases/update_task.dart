import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';

abstract class UpdateTask {
  Future<Either<String, int>> call(TaskModel task);
}

class UpdateTaskImpl implements UpdateTask {
  final TaskRepositoryImpl repository;

  UpdateTaskImpl(this.repository);

  @override
  Future<Either<String, int>> call(TaskModel task) async {
    var result = await repository.updateTask(task);
    var response = result.fold(id, id);
    if (response is String) {
      return Left(response);
    }
    return Right(response);
  }
}
