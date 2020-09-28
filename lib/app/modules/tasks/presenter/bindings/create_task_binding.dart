import 'package:get/get.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/create_task.dart';
import 'package:tasklist/app/modules/tasks/external/datasource/database_datasource_impl.dart';
import 'package:tasklist/app/modules/tasks/infra/repositories/task_repository_impl.dart';
import 'package:tasklist/app/modules/tasks/presenter/controllers/create_task_controller.dart';

class CreateTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTaskController>(() => CreateTaskController(
        createTask:
            CreateTaskImpl(TaskRepositoryImpl(DatabaseDatasourceImpl()))));
  }
}
