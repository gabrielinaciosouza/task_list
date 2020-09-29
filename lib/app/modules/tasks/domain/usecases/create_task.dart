import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';

abstract class CreateTask {
  Future<Either<String, TaskModel>> call(TaskModel task);
}

class CreateTaskImpl implements CreateTask {
  final TaskRepositoryImpl repository;
  CreateTaskImpl(this.repository);

  @override
  Future<Either<String, TaskModel>> call(TaskModel task) async {
    var result = await repository.insertTask(task);
    var response = result.fold(id, id);
    if (response is String) {
      return Left(response);
    }
    return Right(response);
  }
}
