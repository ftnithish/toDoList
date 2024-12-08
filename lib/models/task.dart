// task.dart
class Task {
  String title;
  String status; // e.g., "pending", "priority", "completed"
  DateTime dateTimeAdded;
  bool isCompleted;
  bool isFavourite;

  Task({
    required this.title,
    this.status = "pending",
    required this.dateTimeAdded,
    this.isCompleted = false,
    this.isFavourite = false,
  });

  // Convert Task to JSON (for storage or API requests)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'status': status,
      'dateTimeAdded': dateTimeAdded.toIso8601String(),
      'isFavourite': isFavourite,
    };
  }

  // Create Task from JSON (for loading data)
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      status: json['status'],
      dateTimeAdded: DateTime.parse(json['dateTimeAdded']),
      isFavourite: json['isFavourite'] ?? false,
    );
  }
}


