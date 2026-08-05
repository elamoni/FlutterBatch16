import 'package:flutter/material.dart';
import 'package:task_manager/widgets/screen_BG.dart';

import '../core/typography.dart';
import '../widgets/appRichTextLink.dart';
import '../widgets/custom_btn.dart';
import '../widgets/input_field.dart';
import 'home_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


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
            Form(child: Column(
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
                CustomBtn(onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ); },),

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
