import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';
//import '../utils/constants.dart';
class TaskStorage {
  static const String _taskKey = 'tasks';

  // Save tasks to SharedPreferences
  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonTasks = tasks.map((task) => json.encode(task.toJson())).toList();
    await prefs.setStringList(_taskKey, jsonTasks);
  }

  // Load tasks from SharedPreferences
  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonTasks = prefs.getStringList(_taskKey);
    if (jsonTasks == null) return [];
    return jsonTasks.map((jsonTask) => Task.fromJson(json.decode(jsonTask))).toList();
  }
}
