// import 'package:flutter/material.dart';

// class TaskTemplateScreen extends StatelessWidget {
//   final Function(String, String) onTaskSelected;

//   TaskTemplateScreen({super.key, required this.onTaskSelected});

//   final List<Map<String, dynamic>> taskTemplates = [
//     {
//       'icon': Icons.local_drink,
//       'title': 'Drink Water',
//     },
//     {
//       'icon': Icons.directions_run,
//       'title': 'Morning Run',
//     },
//     {
//       'icon': Icons.book,
//       'title': 'Read a Book',
//     },
//     {
//       'icon': Icons.bedtime,
//       'title': 'Go to Bed Early',
//     },
//     {
//       'icon': Icons.breakfast_dining,
//       'title': "Reminder for Your Breakfast",
//     },
//     {
//       'icon': Icons.music_note,
//       'title': 'Healing Time',
//     },
//     {
//       'icon': Icons.favorite,
//       'title': 'Practice Gratitude',
//     },
//     {
//       'icon': Icons.shopping_cart,
//       'title': 'Go Shopping',
//     },
//     {
//       'icon': Icons.work,
//       'title': 'Prepare Presentation',
//     },
//     {
//       'icon': Icons.coffee,
//       'title': 'Take a Break',
//     },
//     {
//       'icon': Icons.message,
//       'title': 'Check on Family',
//     },
//     {
//       'icon': Icons.medication,
//       'title': 'Take Your Pills',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Task Templates")),
//       body: ListView.builder(
//         itemCount: taskTemplates.length,
//         itemBuilder: (context, index) {
//           final task = taskTemplates[index];
//           return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 leading: Icon(task['icon']),
//                 title: Text(task['title']),
//                 trailing: TextButton(
//                   style: ButtonStyle(
//                       iconColor: WidgetStateProperty.all(Colors.orange)),
//                   onPressed: () {
//                     onTaskSelected(task['title'], 'general');
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text(
//                     "Add",
//                   ),
//                 ),
//               ));
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskTemplateScreen extends StatelessWidget {
  final List<Map<String, dynamic>> taskTemplates = [
    {'icon': Icons.local_drink, 'title': 'Drink Water'},
    {'icon': Icons.directions_run, 'title': 'Morning Run'},
    {'icon': Icons.book, 'title': 'Read a Book'},
    {'icon': Icons.bedtime, 'title': 'Go to Bed Early'},
    {'icon': Icons.breakfast_dining, 'title': 'Reminder for Your Breakfast'},
    {'icon': Icons.music_note, 'title': 'Healing Time'},
    {'icon': Icons.favorite, 'title': 'Practice Gratitude'},
    {'icon': Icons.shopping_cart, 'title': 'Go Shopping'},
    {'icon': Icons.business, 'title': 'Prepare Presentation'},
    {'icon': Icons.coffee, 'title': 'Take a Break'},
    {'icon': Icons.message, 'title': 'Check on Family'},
    {'icon': Icons.medication, 'title': 'Take Your Pills'},
  ];

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Task Templates')),
      body: ListView.builder(
        itemCount: taskTemplates.length,
        itemBuilder: (context, index) {
          final template = taskTemplates[index];
          return ListTile(
            leading: Icon(template['icon']),
            title: Text(template['title']),
            trailing: TextButton(
              onPressed: () {
                taskProvider.addTask(Task(
                  title: template['title'],
                  dateTimeAdded: DateTime.now(),
                ));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${template['title']} added!'),
                ));
              },
              child: Text('Add', style: TextStyle(color: Colors.purple)),
            ),
          );
        },
      ),
    );
  }
}