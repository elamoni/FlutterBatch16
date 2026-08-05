import 'package:flutter/material.dart';
import 'package:task_manager/screens/pin_varification_screen.dart';
import 'package:task_manager/screens/progress_screen.dart';
import 'package:task_manager/screens/set_password_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      //home: HomedScreen(),
      //home: SetPasswordScreen(),
      //home: SignUpScreen(),

      //home: PinVerificationScreen(),
      home: SplashScreen(),
      //home: ProgressScreen(),
    );
  }
}
