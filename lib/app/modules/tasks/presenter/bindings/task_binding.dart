import 'package:get/get.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/delete_task.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/get_task.dart';
import 'package:tasklist/app/modules/tasks/external/datasource/database_datasource_impl.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';
import 'package:tasklist/app/modules/tasks/presenter/controllers/task_controller.dart';

import '../../domain/usecases/update_task.dart';
import '../../external/datasource/database_datasource_impl.dart';
import '../controllers/task_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController(
        getTask: GetTaskImpl(TaskRepositoryImpl(DatabaseDatasourceImpl())),
        updateTask:
            UpdateTaskImpl(TaskRepositoryImpl(DatabaseDatasourceImpl())),
        deleteTask:
            DeleteTaskImpl(TaskRepositoryImpl(DatabaseDatasourceImpl()))));
  }
}
