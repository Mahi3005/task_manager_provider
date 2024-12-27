import 'package:flutter/material.dart';
import 'package:task_manager/task.dart';

class TaskProvider with ChangeNotifier{
  final List<Task> _tasks=[];

  List<Task> get tasks => _tasks;

   void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }
   void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
   void toggleTaskStatus(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }
}