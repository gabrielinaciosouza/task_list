import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:tasklist/app/modules/tasks/presenter/controllers/create_task_controller.dart';
import 'package:tasklist/app/modules/tasks/presenter/pages/create_task_page.dart';

class TimePage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  CreateTaskController createTaskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TimePickerSpinner(
              is24HourMode: true,
              normalTextStyle: TextStyle(fontSize: 24, color: Colors.black12),
              highlightedTextStyle:
                  TextStyle(fontSize: 24, color: Colors.black),
              spacing: 50,
              itemHeight: 80,
              isForce2Digits: true,
              onTimeChange: (time) {
                setState(() {
                  createTaskController.currentTime = time;
                });
              },
            ),
            Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                color: Colors.cyan,
                onPressed: () => Get.off(CreateTaskPage()),
                child: Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
