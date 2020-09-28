import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

abstract class UpdateTask {
  Future<Either<UpdateError, int>> call(TaskModel task);
}

class UpdateTaskImpl implements UpdateTask {
  final TaskRepositoryImpl repository;

  UpdateTaskImpl(this.repository);

  @override
  Future<Either<UpdateError, int>> call(TaskModel task) async {
    var result = await repository.updateTask(task);
    return result.where(
        (r) => r.isFinite, () => UpdateError(message: 'Id da tarefa é nulo'));
  }
}
