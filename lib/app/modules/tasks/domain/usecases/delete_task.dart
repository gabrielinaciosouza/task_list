import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

abstract class DeleteTask {
  Future<Either<DeleteError, int>> deleteTask(int id);
}

class DeleteTaskImpl implements DeleteTask {
  final TaskRepositoryImpl repository;

  DeleteTaskImpl(this.repository);

  @override
  Future<Either<DeleteError, int>> deleteTask(int id) async {
    var result = await repository.deleteTask(id);
    return result.where(
        (r) => r.isFinite, () => DeleteError(message: 'Id da tarefa é nulo'));
  }
}
