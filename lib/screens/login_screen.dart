import 'package:flutter/material.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/widgets/screen_BG.dart';

import '../core/typography.dart';
import '../widgets/appRichTextLink.dart';
import '../widgets/custom_btn.dart';
import '../widgets/input_field.dart';
import 'home_screen.dart';
import 'main_nav_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(child: Padding(
        padding: const EdgeInsets.only(left: 56,right: 56,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get Started With',
              style: AppTypography.Heading,
            ),
            Form(
              key: _formKey,
              child: Column(
        children: [
          SizedBox(height: 20,),
          InputField(controller: _emailController, hintText: 'Mail',
          validator: (value){
            if(value == null || value.isEmpty){
              return 'Please enter email';
            }else{
              return null;
            }
          },
          ),
          SizedBox(height: 20,),
          InputField(controller: _passwordController, hintText: 'Password',
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter Password';
              }else{
                return null;
              }
            },
          ),CustomBtn(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainNavScreen(),
                  ),
                );
              }
            },
          ),


          AppRichTextLink(
            text: "Don't have account?",
            linkText: "Sign up",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            }

          )
        ],
            ),)
          ],
        ),
      )),
    );
  }
}
