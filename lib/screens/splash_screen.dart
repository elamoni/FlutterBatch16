import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/util/asset_path.dart';
import 'package:task_manager/widgets/screen_BG.dart';

import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    moveToNextScreen();
  }


  Future<void>moveToNextScreen()async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()),);

    //AuthController.getUserData();
   // final bool isLogin = await AuthController.isUserLogin();

    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>isLogin ? MainNavScreen() : LoginScreen()));
  }



  @override
  Widget build(BuildContext context) {
    return ScreenBg(
      child:Center(

      child:Image.asset(AssetPath.logo, width: 300, height: 300,)),
    );
  }
}
