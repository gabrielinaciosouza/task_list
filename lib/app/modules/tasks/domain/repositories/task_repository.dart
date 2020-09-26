import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTask();
  Future<TaskModel> insertTask(TaskModel task);
  Future<int> updateTask(TaskModel task);
  Future<int> deleteTask(int id);
}
