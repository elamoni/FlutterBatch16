import 'package:flutter/material.dart';
class TaskCountByStatus extends StatelessWidget {
  final String title;
  final int count;

  const TaskCountByStatus({
    super.key, required this.title, required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [

            Text(count.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
