import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/screens/new_task_screen.dart';
import 'package:task_manager/screens/progress_screen.dart';

import 'cancel_task_screen.dart';
import 'completed_task_screen.dart';
import 'create_task_screen.dart';
import 'login_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int selectedIndex = 0;

  List screens = [
    NewTaskScreen(),
    ProgressScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:  const AssetImage('assets/Esmot.jpg'),
            
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Esmot Ara',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),),
                Text('aesmot@gmail.com',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),),
              ],
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () async {
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            await sharedPreferences.clear();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: screens[selectedIndex ],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(


          indicatorColor: Colors.green,
          indicatorShape: const RoundedRectangleBorder(),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                (states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: Colors.black);
              }
              return const IconThemeData(color: Colors.green);
            },
          ),




        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(color: Colors.black);
            }
            return const TextStyle(color: Colors.green);
          },
        ),
      ),

      child: NavigationBar(
        //height: 160,
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index){
              selectedIndex =  index;
              setState(() {
        
              });
            },
        
            destinations: [
          NavigationDestination(icon: Icon(Icons.task), label: 'New'),
          NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.task_alt_outlined), label:'Completed'),
          NavigationDestination(icon: Icon(Icons.cancel_outlined), label: 'Cancel'),
            ],),
      ),



      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTaskScreen()));

      }, child: Icon(Icons.add),),

    );
  }
}
