import 'package:flutter/material.dart';

class TaskTemplates extends StatelessWidget {
  final List<String> templates;
  final Function(String) onTemplateSelect;

  const TaskTemplates({
    Key? key,
    required this.templates,
    required this.onTemplateSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: templates.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(templates[index]),
          trailing: Icon(Icons.add),
          onTap: () => onTemplateSelect(templates[index]),
        );
      },
    );
  }
}
