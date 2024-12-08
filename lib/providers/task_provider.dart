// task_provider.dart
import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  // Getter to retrieve tasks
  List<Task> get tasks => _tasks;

  // Add a new task
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners(); // Notify UI to rebuild
  }

  // Update task status (pending or completed)
  void updateTaskStatus(Task task) {
    final index = _tasks.indexOf(task);
    if (index != -1) {
      _tasks[index].status = task.status == 'completed' ? 'pending' : 'completed';
      notifyListeners();
    }
  }

  // Toggle task favorite status
  void toggleFavorite(Task task) {
    final index = _tasks.indexOf(task);
    if (index != -1) {
      _tasks[index].isFavourite = !_tasks[index].isFavourite;
      notifyListeners();
    }
  }

  // Delete a task
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  // Load saved tasks (from local storage or database)
  void loadTasks(List<Task> savedTasks) {
    _tasks = savedTasks;
    notifyListeners();
  }
}
