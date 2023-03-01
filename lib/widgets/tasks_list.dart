import 'package:flutter/material.dart';
import 'tasks_tile.dart';

import 'package:provider/provider.dart';

import 'package:todo_app/models/tasks_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              final task = TaskData.tasks[index];
              return TaskTile(
                  longPressCallback: () {
                    TaskData.deleteTask(task);
                  },
                  isChecked: TaskData.tasks[index].isDone,
                  taskTitle: TaskData.tasks[index].name,
                  checkboxCallback: (checkboxState) {
                    TaskData.updateTask(task);
                  });
            },
            itemCount: TaskData.tasks.length);
      },
    );
  }
}
