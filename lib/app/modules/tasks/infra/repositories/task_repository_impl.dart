import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/domain/repositories/task_repository.dart';
import 'package:tasklist/app/modules/tasks/infra/datasources/database_datasource.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

class TaskRepositoryImpl implements TaskRepository {
  final DatabaseDatasource datasource;

  TaskRepositoryImpl(this.datasource);

  @override
  Future<Either<DeleteError, int>> deleteTask(int id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<GetError, List<TaskModel>>> getTask() {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<Either<InsertError, TaskModel>> insertTask(TaskModel task) {
    // TODO: implement insertTask
    throw UnimplementedError();
  }

  @override
  Future<Either<UpdateError, int>> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
