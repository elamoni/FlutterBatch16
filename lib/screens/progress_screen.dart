
import 'package:flutter/material.dart';

import '../data/model/task_model.dart';
import '../data/services/api_caller.dart';
import '../util/urls.dart';
import '../widgets/task_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<TaskModel>taskList = [];

  Future<void>getAllTask() async {
    final response = await ApiCaller.getRequest(URL: TMUrls.AllTask('Progress'));

    List<TaskModel> temList=[];

    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data']){
        temList.add(TaskModel.fromJson(jsonData));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }

    taskList = temList;

    setState(() {

    });

  }

  @override
  void initState() {
    super.initState();
    getAllTask();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(

          itemCount:taskList.length ,
          itemBuilder: (context,index){
            return   TaskCard(taskModel:taskList[index], cardColor: Colors.blue, refreshParent: () {
              getAllTask();
            },

            );
          })
    );
  }
}
