import 'package:flutter/material.dart';
import 'package:task_manager/screens/new_task_screen.dart';
import 'package:task_manager/widgets/screen_BG.dart';

import '../core/typography.dart';
import '../data/model/api_response.dart';
import '../data/services/api_caller.dart';
import '../util/urls.dart';
import '../widgets/appRichTextLink.dart';
import '../widgets/custom_btn.dart';
import '../widgets/input_field.dart';
import 'home_screen.dart';
import 'login_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  onTapLogin(){
    Navigator.pop(context);
  }

  Future<void>signUp() async {
    final ApiResponse response =await ApiCaller.postRequest(URL: TMUrls.SignupURL,
        body: {
          "email":_emailController.text,
          "firstName":_firstNameController.text,
          "lastName":_lastNameController.text,
          "mobile":_mobileController.text,
          "password":_passwordController.text
        }
    );

    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SignUp success.....!')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something wrong..!')));

    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
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
              'Join With US',
              style: AppTypography.Heading,
            ),
            Form(
              key: _formKey,
              child: Column(

              children: [
                SizedBox(height: 20,),
                InputField(controller: _emailController, hintText: 'Mail',),
                SizedBox(height: 20,),
                InputField(controller: _firstNameController, hintText: 'Password',),
                SizedBox(height: 20,),
                InputField(controller: _lastNameController, hintText: 'Mail',),
                SizedBox(height: 20,),
                InputField(controller: _mobileController, hintText: 'Mail',),
                SizedBox(height: 20,),

                InputField(controller: _passwordController, hintText: 'Password',),

                CustomBtn(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signUp();
                  }
                },
                ),

                AppRichTextLink(
                  text: "Have account?",
                  linkText: "Sign In",
                  onTap: () {
                    // Navigate to Sign up
                  },
                )
              ],
            ),)
          ],
        ),
      )),
    );
  }
}
