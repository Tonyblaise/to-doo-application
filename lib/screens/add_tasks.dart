import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:todo_app/models/tasks_data.dart';
import 'package:todo_app/screens/add_tasks.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:provider/provider.dart';

class AddTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent),
              onPressed: (() {
                //Add tasks to our list

                Provider.of<TaskData>(context).addTask(newTaskTitle);
                Navigator.pop(context);
              }),
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
