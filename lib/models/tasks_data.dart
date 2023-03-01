import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import "package:todo_app/models/tasks.dart";
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  set tasks(List<Task> tasks) {
    _tasks = tasks;
  }

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
