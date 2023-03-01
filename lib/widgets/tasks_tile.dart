

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final VoidCallback longPressCallback;

  TaskTile(
    
      {required this.longPressCallback,
        required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
        title: Text(
          "$taskTitle",
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,

          /// onChanged: toggleCheckboxState(checkboxState),
          activeColor: Colors.lightBlueAccent,
          onChanged: (bool? value) {
            checkboxCallback(value);
          },
        ));
  }
}
