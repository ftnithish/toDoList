import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/task_item.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import 'notes_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Tracks the selected bottom navigation index

  @override
  Widget build(BuildContext context) {
    // Screens for BottomNavigationBar
    final screens = [
      TasksScreen(), // Tasks tab
      NotesScreen(), // Notes tab
    ];

    return Scaffold(
      body: screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
        ],
      ),
    );
  }
}

/// Tasks screen with All, Unfinished, and Finished categories
class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int _selectedCategoryIndex = 0; // Tracks the selected category index

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    // Filter tasks based on the selected category
    List<Task> filteredTasks;
    switch (_selectedCategoryIndex) {
      case 0: // All tasks
        filteredTasks = taskProvider.tasks;
        break;
      case 1: // Unfinished tasks
        filteredTasks =
            taskProvider.tasks.where((task) => !task.isCompleted).toList();
        break;
      case 2: // Finished tasks
        filteredTasks =
            taskProvider.tasks.where((task) => task.isCompleted).toList();
        break;
      default:
        filteredTasks = taskProvider.tasks;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Column(
        children: [
          // Category Selector
          Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton(context, 'All', 0),
                _buildCategoryButton(context, 'Unfinished', 1),
                _buildCategoryButton(context, 'Finished', 2),
              ],
            ),
          ),
          // Task List
          Expanded(
            child: filteredTasks.isEmpty
                ? Center(
                    child: Text(
                      'No tasks available!',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = filteredTasks[index];
                      return TaskItem(
                        task: task,
                        onFavorite: () => taskProvider.toggleFavorite(task),
                        onDelete: () => taskProvider.deleteTask(task),
                        onStatusToggle: () =>
                            taskProvider.updateTaskStatus(task),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new task with default values
          taskProvider.addTask(Task(
            title: 'New Task ${taskProvider.tasks.length + 1}',
            dateTimeAdded: DateTime.now(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Helper to build category buttons
  Widget _buildCategoryButton(BuildContext context, String label, int index) {
    final isSelected = _selectedCategoryIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.8)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Theme.of(context).textTheme.bodyMedium!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
