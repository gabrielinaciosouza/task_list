import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasklist/app/modules/tasks/presenter/bindings/create_task_binding.dart';
import 'package:tasklist/app/modules/tasks/presenter/controllers/task_controller.dart';
import 'package:tasklist/app/modules/tasks/presenter/pages/calendar_page.dart';
import 'create_task_page.dart';

class TaskPage extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
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
                    GetX<TaskController>(
                      initState: (state) {
                        Get.find<TaskController>().getAll();
                      },
                      builder: (_) {
                        return _.taskList.length < 1
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Expanded(
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    var parsedDate =
                                        DateTime.parse(_.taskList[index].date);
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(parsedDate);

                                    var parsedTime =
                                        DateTime.parse(_.taskList[index].time);
                                    String formattedTime =
                                        DateFormat('HH:mm').format(parsedTime);

                                    Color color;

                                    if (_.taskList[index].status ==
                                        'Finalizado') color = Colors.cyan;

                                    if (_.taskList[index].status == 'Andamento')
                                      color = Colors.blue;

                                    if (_.taskList[index].status == 'Tarefas')
                                      color = Colors.blueGrey;

                                    return Container(
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
                                                  _.taskList[index].title,
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

                                              _.taskList[index].status ==
                                                      'Finalizado'
                                                  ? Icon(
                                                      Icons.check_circle,
                                                      color: Colors.white,
                                                    )
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
                                                formattedDate,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.white70),
                                              ),
                                              Spacer(),
                                              _.taskList[index].status ==
                                                      'Finalizado'
                                                  ? Text(
                                                      _.taskList[index].status,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    )
                                                  : Text(
                                                      formattedTime,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                          color:
                                                              Colors.white70),
                                                    ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                    height: 16,
                                    color: Colors.transparent,
                                  ),
                                  itemCount: _.taskList.length,
                                ),
                              );
                      },
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
                        color: Colors.cyan,
                        child: Text(
                          "NOVA TAREFA",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        onPressed: () {
                          Get.to(CreateTaskPage(),
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
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
                  Container(
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

                  ///More buttons
                  ///ForSpace
                  SizedBox(
                    height: 16,
                  ),

                  ///Container for cat button
                  Container(
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

                  ///More buttons
                  ///ForSpace
                  SizedBox(
                    height: 16,
                  ),

                  ///Container for cat button
                  Container(
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
  }
}
