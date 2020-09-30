import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/create_task.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';

class CreateTaskController extends GetxController {
  final CreateTask createTask;

  CreateTaskController({@required this.createTask})
      : assert(createTask != null);

  final _currentDate = DateTime.now().obs;
  set currentDate(value) => this._currentDate.value = value;
  DateTime get currentDate => this._currentDate.value;

  final _currentTime = DateTime.now().obs;
  set currentTime(value) => this._currentTime.value = value;
  DateTime get currentTime => this._currentTime.value;

  final _creatPageCalendar = false.obs;
  set createPageCalendar(value) => this._creatPageCalendar.value = value;
  bool get createPageCalendar => this._creatPageCalendar.value;

  final _pressedTaskCategorie = false.obs;
  set pressedTaskCategorie(value) => this._pressedTaskCategorie.value = value;
  bool get pressedTaskCategorie => this._pressedTaskCategorie.value;

  final _categorie = 'Tarefas'.obs;
  set categorie(value) => this._categorie.value = value;
  String get categorie => this._categorie.value;

  TaskModel foldValue(Either<String, TaskModel> value) {
    return value.fold(id, id) as TaskModel;
  }
}
