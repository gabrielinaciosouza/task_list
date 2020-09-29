import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';

abstract class GetTask {
  Future<Either<String, List<TaskModel>>> call();
}

class GetTaskImpl implements GetTask {
  final TaskRepositoryImpl repository;

  GetTaskImpl(this.repository);

  @override
  Future<Either<String, List<TaskModel>>> call() async {
    var result = await repository.getTask();
    var response = result.fold(id, id);
    if (response is String) {
      return Left(response);
    }
    return Right(response);
  }
}
