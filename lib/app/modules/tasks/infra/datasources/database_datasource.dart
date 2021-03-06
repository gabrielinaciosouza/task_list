import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

abstract class DatabaseDatasource {
  Future<Either<GetError, List<TaskModel>>> getTask();
  Future<Either<InsertError, TaskModel>> insertTask(TaskModel task);
  Future<Either<UpdateError, int>> updateTask(TaskModel task);
  Future<Either<DeleteError, int>> deleteTask(int id);
  Future<Either<CreateError, Database>> createDatabase();
}
