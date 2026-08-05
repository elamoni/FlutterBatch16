import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_model.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count_by_status.dart';
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [

          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index){
              return SizedBox(width: 80,
                  child: TaskCountByStatus(title: 'New ', count: 20,));

            },
            separatorBuilder: (context,index){
                return SizedBox(width: 8,);
            },
            ),
          ),

          ////
          Expanded(
            child: ListView.builder(
                //itemCount:taskList.length ,
                itemCount:8,
                itemBuilder: (context, index){
                  return
              TaskCard(taskModel: TaskModel(), cardColor: Colors.blue, refreshParent: () {  });
            }),
          ),
          //listview builder


          ],
      ),
         );
  }
}
