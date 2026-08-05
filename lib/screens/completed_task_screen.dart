import 'package:flutter/material.dart';

import '../data/model/task_model.dart';
import '../widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return TaskCard(
            taskModel: TaskModel(
              title: 'Task $index',
              description: 'This is task description',
              status: 'Progress',
              createdDate: '2026-08-05',
            ),
            cardColor: Colors.green,
            refreshParent: () {},
          );
        },
      ),
    );
  }
}
