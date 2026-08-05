import 'package:flutter/material.dart';

import '../data/model/task_model.dart';


class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;
  const TaskCard({

    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
            title: Text(taskModel.title?? 'hjhjhj', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            //SizedBox(height: 5,),
            subtitle: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text('Reigning league champions Bashundhara Kings, runners-up',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,),),
                SizedBox(height: 5,),
                Text('Date: ' ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Chip(label: Text('New'),
                      backgroundColor: cardColor,
                      labelStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_note,color: Colors.green,),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,),),


                  ],
                )

              ],
            )

        ),
      ),
    );
  }
}
