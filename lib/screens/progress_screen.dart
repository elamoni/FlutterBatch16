
import 'package:flutter/material.dart';

import '../data/model/task_model.dart';
import '../widgets/task_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
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
            cardColor: Colors.purple,
            refreshParent: () {},
          );
        },
      ),
    );
  }
}
