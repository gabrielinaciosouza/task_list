import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

abstract class CreateTask {
  Future<Either<InsertError, TaskModel>> call(TaskModel task);
}

class CreateTaskImpl implements CreateTask {
  final TaskRepositoryImpl repository;
  CreateTaskImpl(this.repository);

  @override
  Future<Either<InsertError, TaskModel>> call(TaskModel task) async {
    var result = await repository.insertTask(task);
    var response = result.fold(id, id);
    return Right(response);
  }
}
