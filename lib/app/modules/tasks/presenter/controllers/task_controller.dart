import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/delete_task.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/get_task.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';

import '../../domain/usecases/get_task.dart';
import '../../domain/usecases/update_task.dart';

class TaskController extends GetxController {
  final GetTaskImpl getTask;
  final UpdateTaskImpl updateTask;
  final DeleteTaskImpl deleteTask;

  TaskController(
      {@required this.deleteTask,
      @required this.updateTask,
      @required this.getTask})
      : assert(getTask != null && updateTask != null);

  final _taskList = List<TaskModel>().obs;
  // ignore: invalid_use_of_protected_member
  List<TaskModel> get taskList => this._taskList.value;
  set taskList(value) => this._taskList.value = value;

  final _builder = false.obs;
  bool get builder => this._builder.value;
  set builder(value) => this._builder.value = value;

  getAll() {
    getTask.call().then((value) {
      var response = value.fold(id, id);
      this.taskList = response;
      update();
    });
  }
}
