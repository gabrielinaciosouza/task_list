import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/delete_task.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/get_task.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';

import '../../domain/usecases/get_task.dart';
import '../../domain/usecases/update_task.dart';

enum status { TAREFAS, ANDAMENTO, FINALIZADO }

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

  final _onlyTaskList = List<TaskModel>().obs;
  // ignore: invalid_use_of_protected_member
  List<TaskModel> get onlyTaskList {
    List<TaskModel> list = [];
    for (var task in taskList) {
      if (task.status == 'Tarefas') {
        list.add(task);
      }
    }
    return list;
  }

  set onlyTaskList(value) => this._onlyTaskList.value = value;

  final _progressList = List<TaskModel>().obs;
  // ignore: invalid_use_of_protected_member
  List<TaskModel> get progressList {
    List<TaskModel> list = [];
    for (var task in taskList) {
      if (task.status == 'Andamento') {
        list.add(task);
      }
    }
    return list;
  }

  set progressList(value) => this._progressList.value = value;

  final _finishedList = List<TaskModel>().obs;
  // ignore: invalid_use_of_protected_member
  List<TaskModel> get finishedList {
    List<TaskModel> list = [];
    for (var task in taskList) {
      if (task.status == 'Finalizado') {
        list.add(task);
      }
    }
    return list;
  }

  set finishedList(value) => this._finishedList.value = value;

  var _statusBuild = 'Tarefas'.obs;
  String get statusBuild => _statusBuild.value;
  set statusBuild(value) => _statusBuild.value = value;

  var _error = ''.obs;
  String get error => _error.value;
  set error(value) => _error.value = value;

  getAll() async {
    await getTask.call().then((value) {
      var response = value.fold(id, id);
      if (response is String) {
        this.error = response;
        return;
      }
      this.taskList = response;
      update();
    });
  }
}
