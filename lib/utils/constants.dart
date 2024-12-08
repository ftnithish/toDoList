import 'package:flutter/material.dart';

class AppConstants {
  // Application Information
  static const String appName = 'To-Do App';

  // Default Messages
  static const String noTasksMessage = 'No tasks available.';
  static const String noNotesMessage = 'No notes found.';
  static const String addTaskPrompt = 'Add a new task';
  static const String addNotePrompt = 'Add a new note';

  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.white;
  static const Color favoriteColor = Colors.yellow;
  static const Color deleteColor = Colors.red;
  static const Color pendingTaskColor = Colors.grey;
  static const Color completedTaskColor = Colors.green;

  // Padding and Margins
  static const double defaultPadding = 16.0;
  static const double cardMargin = 8.0;

  // Font Sizes
  static const double titleFontSize = 20.0;
  static const double subtitleFontSize = 16.0;
  static const double bodyFontSize = 14.0;

  // Icons
  static const IconData addIcon = Icons.add;
  static const IconData deleteIcon = Icons.delete;
  static const IconData favoriteIcon = Icons.star;
  static const IconData pendingIcon = Icons.hourglass_empty;
  static const IconData completedIcon = Icons.check_circle;

  // Durations (for animations, etc.)
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Keys for SharedPreferences
  static const String taskKey = 'tasks';
  static const String noteKey = 'notes';
}
