import 'package:flutter/material.dart';
import 'package:task_manager/widgets/screen_BG.dart';

import '../core/typography.dart';
import '../widgets/appRichTextLink.dart';
import '../widgets/custom_btn.dart';
import '../widgets/input_field.dart';
import 'home_screen.dart';
class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              'Set Password',
              style: AppTypography.Heading,
            ),
            SizedBox(height: 8),
            Text(
              'Minimum length password 8 character with\nLetter and number combination',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9CA3AF),
                height: 1.4,
              ),
            ),

            Form(child: Column(
              children: [
                SizedBox(height: 20,),
                InputField(controller: passwordController, hintText: 'Password',),
                SizedBox(height: 20,),
                InputField(controller: passwordController, hintText: 'Confirm Password',),
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
                ),
              ],
            ),)
          ],
        ),
      )),
    );
  }
}
