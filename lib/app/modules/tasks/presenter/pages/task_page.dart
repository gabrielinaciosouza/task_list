import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/presenter/bindings/create_task_binding.dart';
import 'package:tasklist/app/modules/tasks/presenter/controllers/task_controller.dart';
import 'package:tasklist/app/modules/tasks/presenter/pages/calendar_page.dart';
import 'package:tasklist/app/modules/tasks/presenter/pages/error_page.dart';
import 'create_task_page.dart';

class TaskPage extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return GetX<TaskController>(initState: (state) {
      Get.find<TaskController>().getAll();
    }, builder: (_) {
      if (_.error != '') {
        return ErrorPage(error: _.error);
      }

      List<TaskModel> list = _.onlyTaskList;
      if (_.statusBuild == 'Tarefas') {
        list = _.onlyTaskList;
      }

      if (_.statusBuild == 'Andamento') {
        list = _.progressList;
      }

      if (_.statusBuild == 'Finalizado') {
        list = _.finishedList;
      }

      return Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          child: Row(
            children: [
              ///Container for Content
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ah! Lembrei!",
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.2,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w900,
                            color: Colors.blueGrey[200]),
                      ),

                      ///For spacing
                      SizedBox(
                        height: 4,
                      ),

                      Row(
                        children: [
                          ///Text
                          Text(
                            "Tarefas",
                            style: TextStyle(
                              fontSize: 50,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),

                          Spacer(),
                        ],
                      ),

                      ///List of all the task
                      list.length < 1
                          ? Expanded(
                              child: Center(
                                child: Text(
                                  'Ops! Nenhuma tarefa por aqui!',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  var parsedDate =
                                      DateTime.parse(list[index].date);

                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(parsedDate);

                                  var parsedDate1;
                                  String formattedDate1;
                                  if (list[index].date1 != null) {
                                    parsedDate1 =
                                        DateTime.parse(list[index].date1);
                                    formattedDate1 = DateFormat('dd-MM-yyyy')
                                        .format(parsedDate1);
                                  }

                                  var parsedDate2;
                                  String formattedDate2;
                                  if (list[index].date2 != null) {
                                    parsedDate2 =
                                        DateTime.parse(list[index].date2);
                                    formattedDate2 = DateFormat('dd-MM-yyyy')
                                        .format(parsedDate2);
                                  }

                                  var parsedTime =
                                      DateTime.parse(list[index].time);
                                  String formattedTime =
                                      DateFormat('HH:mm').format(parsedTime);

                                  var parsedTime1;
                                  String formattedTime1;
                                  if (list[index].time1 != null) {
                                    parsedTime1 =
                                        DateTime.parse(list[index].time1);
                                    formattedTime1 =
                                        DateFormat('HH:mm').format(parsedTime1);
                                  }

                                  var parsedTime2;
                                  String formattedTime2;
                                  if (list[index].time2 != null) {
                                    parsedTime2 =
                                        DateTime.parse(list[index].time2);
                                    formattedTime2 =
                                        DateFormat('HH:mm').format(parsedTime2);
                                  }

                                  Color color;

                                  if (list[index].status == 'Finalizado')
                                    color = Colors.cyan;

                                  if (list[index].status == 'Andamento')
                                    color = Colors.blue;

                                  if (list[index].status == 'Tarefas')
                                    color = Colors.blueGrey;

                                  return GestureDetector(
                                    onTap: () {
                                      if (list[index].status == 'Tarefas') {
                                        Get.defaultDialog(
                                            onConfirm: () async {
                                              list[index].status = 'Andamento';
                                              list[index].date1 =
                                                  DateTime.now().toString();
                                              list[index].time1 =
                                                  DateTime.now().toString();

                                              var result = await _.updateTask
                                                  .call(list[index]);
                                              var response =
                                                  _.foldValue(result);

                                              if (response is String) {
                                                return Get.snackbar(
                                                    'Erro!', result as String,
                                                    backgroundColor:
                                                        Colors.red);
                                              }

                                              await _.getAll();

                                              if (_.error != '') {
                                                return Get.snackbar(
                                                    'Erro!', _.error,
                                                    backgroundColor:
                                                        Colors.red);
                                              }
                                              Navigator.of(context).pop();
                                              return;
                                            },
                                            textConfirm: 'Confirmar',
                                            confirmTextColor: Colors.white,
                                            textCancel: 'Cancelar',
                                            middleText:
                                                'Desaja colocar esta tarefa em Andamento?',
                                            title: 'Atenção!');
                                      }
                                      if (list[index].status == 'Andamento') {
                                        Get.defaultDialog(
                                            onConfirm: () async {
                                              list[index].status = 'Finalizado';
                                              list[index].date2 =
                                                  DateTime.now().toString();
                                              list[index].time2 =
                                                  DateTime.now().toString();

                                              var result = await _.updateTask
                                                  .call(list[index]);
                                              var response =
                                                  _.foldValue(result);
                                              if (response is String) {
                                                return Get.snackbar(
                                                    'Erro!', response as String,
                                                    backgroundColor:
                                                        Colors.red);
                                              }
                                              await _.getAll();

                                              if (_.error != '') {
                                                return Get.snackbar(
                                                    'Erro!', _.error,
                                                    backgroundColor:
                                                        Colors.red);
                                              }
                                              Navigator.of(context).pop();
                                            },
                                            textConfirm: 'Confirmar',
                                            confirmTextColor: Colors.white,
                                            textCancel: 'Cancelar',
                                            middleText:
                                                'Desaja finalizar esta Tarefa?',
                                            title: 'Atenção!');
                                      }
                                    },
                                    onLongPress: () {
                                      Get.defaultDialog(
                                          middleText:
                                              'Deseja remover esta tarefa?',
                                          title: 'Atenção!',
                                          confirmTextColor: Colors.white,
                                          textCancel: 'Cancelar',
                                          textConfirm: 'Confirmar',
                                          onConfirm: () async {
                                            var result = await _.deleteTask
                                                .deleteTask(list[index].id);
                                            var response = _.foldValue(result);

                                            if (response is String) {
                                              return Get.snackbar(
                                                  'Erro!', response as String,
                                                  backgroundColor: Colors.red);
                                            }
                                            await _.getAll();

                                            if (_.error != '') {
                                              return Get.snackbar(
                                                  'Erro!', _.error,
                                                  backgroundColor: Colors.red);
                                            }

                                            Navigator.of(context).pop();
                                          });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blueGrey[100]),
                                          color: color),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ///Show completed check
                                          ///Task Title
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${list[index].id} - ${list[index].title}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                              ),

                                              ///For Space
                                              SizedBox(
                                                width: 4,
                                              ),

                                              list[index].status == 'Finalizado'
                                                  ? Icon(Icons.check_circle,
                                                      color: Colors.white)
                                                  : Icon(
                                                      Icons
                                                          .swap_vertical_circle,
                                                      color: Colors.white,
                                                    )
                                            ],
                                          ),

                                          ///For Space
                                          SizedBox(
                                            height: 8,
                                          ),

                                          ///Task Detail
                                          Row(
                                            children: [
                                              Text(
                                                'Criado: $formattedDate',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.white70),
                                              ),
                                              Spacer(),
                                              Text(
                                                formattedTime,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.white70),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              formattedDate1 != null
                                                  ? Text(
                                                      'Andamento: $formattedDate1',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                          color:
                                                              Colors.white70),
                                                    )
                                                  : Container(),
                                              Spacer(),
                                              formattedTime1 != null
                                                  ? Text(
                                                      formattedTime1,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                          color:
                                                              Colors.white70),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              formattedDate2 != null
                                                  ? Text(
                                                      'Finalizado: $formattedDate2',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                          color:
                                                              Colors.white70),
                                                    )
                                                  : Container(),
                                              Spacer(),
                                              list[index].status ==
                                                          'Finalizado' &&
                                                      formattedTime2 != null
                                                  ? Text(
                                                      formattedTime2,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    )
                                                  : Container(),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(
                                  height: 16,
                                  color: Colors.transparent,
                                ),
                                itemCount: list.length,
                              ),
                            ),

                      ///For spacing
                      SizedBox(
                        height: 16,
                      ),

                      ///Button for add new task
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color: Colors.black,
                          child: Text(
                            "Nova Tarefa",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          onPressed: () {
                            Get.off(CreateTaskPage(),
                                binding: CreateTaskBinding());
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///Container for task categories
              Container(
                width: MediaQuery.of(context).size.width * 0.22,
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
                child: Column(
                  children: [
                    ///Menu button
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),

                    ///For space
                    Spacer(),

                    ///Container for cat button
                    GestureDetector(
                      onTap: () {
                        _.statusBuild = 'Tarefas';
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey),
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "T",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),

                    ///More buttons
                    ///ForSpace
                    SizedBox(
                      height: 16,
                    ),

                    ///Container for cat button
                    GestureDetector(
                      onTap: () {
                        _.statusBuild = 'Andamento';
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue),
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),

                    ///More buttons
                    ///ForSpace
                    SizedBox(
                      height: 16,
                    ),

                    ///Container for cat button
                    GestureDetector(
                      onTap: () {
                        _.statusBuild = 'Finalizado';
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.cyan),
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "F",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),

                    ///More buttons
                    ///ForSpace
                    SizedBox(
                      height: 16,
                    ),

                    ///More buttons
                    ///ForSpace
                    Spacer(),

                    ///Menu button
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Get.to(CalendarPage(), binding: CreateTaskBinding());
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
