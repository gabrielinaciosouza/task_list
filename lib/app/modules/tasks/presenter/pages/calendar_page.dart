import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasklist/app/modules/tasks/presenter/controllers/create_task_controller.dart';
import 'package:tasklist/app/modules/tasks/presenter/pages/create_task_page.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  CreateTaskController createTaskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.grey[800],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              calendarStyle: CalendarStyle(
                  todayColor: Colors.green, selectedColor: Colors.cyan),
              onDaySelected: (day, events) {
                if (createTaskController.createPageCalendar == true) {
                  createTaskController.currentDate = day;
                  createTaskController.createPageCalendar = false;
                  Get.off(CreateTaskPage());
                }
              },
              calendarController: _controller,
            )
          ],
        ),
      ),
    );
  }
}
