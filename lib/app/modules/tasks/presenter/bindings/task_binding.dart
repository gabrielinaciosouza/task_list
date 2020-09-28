import 'package:get/get.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/get_task.dart';
import 'package:tasklist/app/modules/tasks/external/datasource/database_datasource_impl.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';
import 'package:tasklist/app/modules/tasks/presenter/controllers/task_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() {
      return TaskController(
          getTask: GetTaskImpl(TaskRepositoryImpl(DatabaseDatasourceImpl())));
    });
  }
}
