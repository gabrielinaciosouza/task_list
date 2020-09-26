import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_task_page.dart';

class TaskPage extends StatelessWidget {
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
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          ///Change appearance of Completed Task
                          ///Say index 1 is completed
                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey[100]),
                                color: index == 1
                                    ? Colors.cyan
                                    : Colors.transparent),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///Show completed check
                                ///Task Title
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Make video for UI challange and upload it today",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: index == 1
                                                ? Colors.white
                                                : Colors.grey[800]),
                                      ),
                                    ),

                                    ///For Space
                                    SizedBox(
                                      width: 4,
                                    ),

                                    index == 1
                                        ? Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                          )
                                        : Container()
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
                                      "18 NOV 2019",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: index == 1
                                              ? Colors.white70
                                              : Colors.grey[500]),
                                    ),
                                    Spacer(),
                                    index == 1
                                        ? Text(
                                            "COMPLETED",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 12,
                                                color: Colors.white),
                                          )
                                        : Text(
                                            "11:00 - 3:00",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: index == 1
                                                    ? Colors.white70
                                                    : Colors.grey[500]),
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
                        itemCount: 6,
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
                        color: Colors.cyan,
                        child: Text(
                          "NOVA TAREFA",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        onPressed: () {
                          Get.to(CreateTaskPage());
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
              height: double.infinity,
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
                        color: Colors.red),
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
                        color: Colors.green),
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
                    onPressed: () {},
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
