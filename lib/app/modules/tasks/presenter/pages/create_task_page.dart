import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  bool remindMe = true;

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
            Container(
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
                  Text(
                    "Friday 28, November",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  )
                ],
              ),
            ),

            ///For Spacing
            SizedBox(
              height: 16,
            ),

            ///Container for timing tray 2
            Container(
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
                  Text(
                    "1:00 - 3:00 PM",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  )
                ],
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
              child: Row(
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
                  Text(
                    "Tarefas",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),

                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  )
                ],
              ),
            ),

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
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
