import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';

abstract class TaskRepository {
  Future<Either<String, List<TaskModel>>> getTask();
  Future<Either<String, TaskModel>> insertTask(TaskModel task);
  Future<Either<String, int>> updateTask(TaskModel task);
  Future<Either<String, int>> deleteTask(int id);
}
