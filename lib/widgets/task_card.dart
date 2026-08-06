import 'package:flutter/material.dart';
import 'package:task_manager/widgets/snack_bar.dart';

import '../data/model/task_model.dart';
import '../data/services/api_caller.dart';
import '../util/urls.dart';


class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;
  const TaskCard({

    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Future<void>deleteTask() async {
    final response =await ApiCaller.getRequest(URL: TMUrls.deleteTask(widget.taskModel.sId.toString()));


    setState(() {

    });

    if(response.isSuccess){
      widget.refreshParent();
      showSnackbar(context,'Task deleted...!');
    }
  }


  Future<void>changeStatus(String status) async {
    final response =await ApiCaller.getRequest(URL: TMUrls.updateTask(widget.taskModel.sId.toString(), status));

    setState(() {

    });

    if(response.isSuccess){
      widget.refreshParent();
      Navigator.pop(context);
      showSnackbar(context,'Task updated...!');
    }
  }

  void showChangeStatusDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Change Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Card(
              child: ListTile(
                title: Text('New'),
                trailing: widget.taskModel.status == 'New' ? Icon(Icons.check_circle,color: Colors.green,) : null,
                onTap: (){
                  changeStatus('New');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Progress'),
                trailing: widget.taskModel.status == 'Progress' ? Icon(Icons.check_circle,color: Colors.green,) : null,
                onTap: (){
                  changeStatus('Progress');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Completed'),
                trailing: widget.taskModel.status == 'Completed' ? Icon(Icons.check_circle,color: Colors.green,) : null,
                onTap: (){
                  changeStatus('Completed');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Cancelled'),
                trailing: widget.taskModel.status == 'Cancelled' ? Icon(Icons.check_circle,color: Colors.green,) : null,
                onTap: (){
                  changeStatus('Cancelled');
                },
              ),
            ),

          ],
        ),
      );
    });
  }


/////////////////////////


  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
            title: Text(widget.taskModel.title.toString(),
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            //SizedBox(height: 5,),
            subtitle: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(widget.taskModel.description.toString(),
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,),),
                SizedBox(height: 5,),
                Text('Date: ${widget.taskModel.createdDate}',style: TextStyle(fontWeight: FontWeight.w500), ),


                SizedBox(height: 5,),
                Row(
                  children: [
                    Chip(label: Text('New'),
                      backgroundColor: widget.cardColor,
                      labelStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                      showChangeStatusDialog();
                    }, icon: Icon(Icons.edit_note,color: Colors.green,),),
                    IconButton(onPressed: (){
                      deleteTask();
                    }, icon: Icon(Icons.delete,color: Colors.red,),),


                  ],
                )

              ],
            )

        ),
      ),
    );
  }
}
