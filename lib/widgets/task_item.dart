import 'package:flutter/material.dart';
import '../models/task.dart';
//import '../utils/constants.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onFavorite;
  final VoidCallback onDelete;
  final VoidCallback onStatusToggle;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onFavorite,
    required this.onDelete,
    required this.onStatusToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.title),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.star, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onFavorite(); // Mark as favorite
        } else {
          onDelete(); // Delete task
        }
      },
      child: ListTile(
        leading: Checkbox(
          value: task.status == "completed",
          onChanged: (_) => onStatusToggle(),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.status == "completed"
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(
          "Priority: ${task.isFavourite ? 'High' : 'Normal'} - Added: ${task.dateTimeAdded}",
        ),
        trailing: Icon(
          task.isFavourite ? Icons.star : Icons.star_border,
          color: task.isFavourite ? Colors.yellow : Colors.grey,
        ),
      ),
    );
  }
}
