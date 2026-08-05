import 'package:flutter/material.dart';

import '../data/model/task_model.dart';
import '../widgets/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
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
            cardColor: Colors.red,
            refreshParent: () {},
          );
        },
      ),
    );
  }
}
