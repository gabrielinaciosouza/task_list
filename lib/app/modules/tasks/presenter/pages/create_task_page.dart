import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/presenter/controllers/create_task_controller.dart';
import 'package:tasklist/app/modules/tasks/presenter/pages/calendar_page.dart';
import 'package:tasklist/app/modules/tasks/presenter/pages/task_page.dart';
import 'package:tasklist/app/modules/tasks/presenter/pages/time_page.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  bool remindMe = true;
  TextEditingController titleController = TextEditingController();
  CreateTaskController createTaskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.off(TaskPage());
          },
          color: Colors.grey[800],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
        child: ListView(
          children: [
            Text(
              "Criar nova Tarefa",
              style: TextStyle(
                  fontSize: 50,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800]),
            ),

            ///Container for TextField
            TextField(
              controller: titleController,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100])),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100])),
                hintText: "Título",
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
            ),

            ///Container for timing tray
            GestureDetector(
              onTap: () {
                createTaskController.createPageCalendar = true;
                Get.to(
                  CalendarPage(),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ///Container for Icon
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(255, 240, 240, 1)),
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.redAccent,
                      ),
                    ),

                    ///For spacing
                    SizedBox(
                      width: 24,
                    ),

                    ///For Text
                    GetX<CreateTaskController>(
                      builder: (_) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(_.currentDate);
                        return Text(
                          formattedDate,
                          style: TextStyle(
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700]),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),

            ///For Spacing
            SizedBox(
              height: 16,
            ),

            ///Container for timing tray 2
            GestureDetector(
              onTap: () {
                Get.to(TimePage());
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ///Container for Icon
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(255, 250, 240, 1)),
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.alarm,
                        color: Colors.orangeAccent,
                      ),
                    ),

                    ///For spacing
                    SizedBox(
                      width: 24,
                    ),

                    ///For Text
                    GetX<CreateTaskController>(
                      builder: (_) {
                        String formattedDate =
                            DateFormat('HH:mm').format(_.currentTime);
                        return Text(
                          formattedDate,
                          style: TextStyle(
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700]),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            ///Container for Task Category
            Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey[100],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(
                  () => Row(
                    children: [
                      ///Container for Icon
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(255, 250, 240, 1)),
                        padding: const EdgeInsets.all(16),
                        child: Icon(
                          Icons.web_asset,
                          color: Colors.orangeAccent,
                        ),
                      ),

                      ///For spacing
                      SizedBox(
                        width: 24,
                      ),

                      ///For Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (createTaskController.pressedTaskCategorie ==
                              false)
                            GestureDetector(
                              onTap: () {
                                if (createTaskController.pressedTaskCategorie ==
                                    false)
                                  createTaskController.pressedTaskCategorie =
                                      true;
                                else
                                  createTaskController.pressedTaskCategorie =
                                      false;
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 12, bottom: 12),
                                child: Text(
                                  createTaskController.categorie,
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          if (createTaskController.pressedTaskCategorie == true)
                            GestureDetector(
                              onTap: () {
                                createTaskController.categorie = 'Tarefas';
                                if (createTaskController.pressedTaskCategorie ==
                                    false)
                                  createTaskController.pressedTaskCategorie =
                                      true;
                                else
                                  createTaskController.pressedTaskCategorie =
                                      false;
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 12, bottom: 12),
                                child: Text(
                                  "Tarefas",
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          if (createTaskController.pressedTaskCategorie == true)
                            GestureDetector(
                              onTap: () {
                                createTaskController.categorie = 'Andamento';
                                if (createTaskController.pressedTaskCategorie ==
                                    false)
                                  createTaskController.pressedTaskCategorie =
                                      true;
                                else
                                  createTaskController.pressedTaskCategorie =
                                      false;
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 12, bottom: 12),
                                child: Text(
                                  "Andamento",
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          if (createTaskController.pressedTaskCategorie == true)
                            GestureDetector(
                              onTap: () {
                                createTaskController.categorie = 'Finalizado';
                                if (createTaskController.pressedTaskCategorie ==
                                    false)
                                  createTaskController.pressedTaskCategorie =
                                      true;
                                else
                                  createTaskController.pressedTaskCategorie =
                                      false;
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 12, bottom: 12),
                                child: Text(
                                  "Finalizado",
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.2,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[700]),
                                ),
                              ),
                            ),
                        ],
                      ),
                      createTaskController.pressedTaskCategorie == false
                          ? IconButton(
                              icon: Icon(Icons.keyboard_arrow_right),
                              onPressed: () {
                                if (createTaskController.pressedTaskCategorie ==
                                    false)
                                  createTaskController.pressedTaskCategorie =
                                      true;
                                else
                                  createTaskController.pressedTaskCategorie =
                                      false;
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.keyboard_arrow_up),
                              onPressed: () {
                                if (createTaskController.pressedTaskCategorie ==
                                    false)
                                  createTaskController.pressedTaskCategorie =
                                      true;
                                else
                                  createTaskController.pressedTaskCategorie =
                                      false;
                              },
                            )
                    ],
                  ),
                )),

            ///For Spacing
            SizedBox(
              height: 16,
            ),

            ///Container for remind
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[100],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ///Container for Icon
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(240, 235, 255, 1)),
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.alarm_on,
                      color: Colors.purpleAccent[100],
                    ),
                  ),

                  ///For spacing
                  SizedBox(
                    width: 24,
                  ),

                  ///For Text
                  Text(
                    "Me lembre",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),

                  Switch(
                    onChanged: (value) {
                      setState(() {
                        remindMe = value;
                      });
                    },
                    value: remindMe,
                    activeColor: Colors.lightBlueAccent,
                  )
                ],
              ),
            ),

            ///Button for Create Task
            Container(
              padding: const EdgeInsets.only(top: 12),
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.black,
                child: Text(
                  "Criar Tarefa",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () {
                  var task = TaskModel(
                    title: titleController.text,
                    date: createTaskController.currentDate.toString(),
                    time: createTaskController.currentTime.toString(),
                    status: createTaskController.categorie,
                  );
                  createTaskController.createTask.call(task);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
