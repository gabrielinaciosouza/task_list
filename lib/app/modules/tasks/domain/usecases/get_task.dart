import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

abstract class GetTask {
  Future<Either<GetError, List<TaskModel>>> call();
}

class GetTaskImpl implements GetTask {
  final TaskRepositoryImpl repository;

  GetTaskImpl(this.repository);

  @override
  Future<Either<GetError, List<TaskModel>>> call() async {
    var result = await repository.getTask();
    var response = result.fold(id, id);
    return Right(response);
  }
}
