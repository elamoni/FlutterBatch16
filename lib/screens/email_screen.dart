import 'package:flutter/material.dart';
import 'package:task_manager/screens/pin_varification_screen.dart';
import 'package:task_manager/widgets/screen_BG.dart';

import '../core/typography.dart';
import '../widgets/appRichTextLink.dart';
import '../widgets/custom_btn.dart';
import '../widgets/input_field.dart';
import 'login_screen.dart';

class Email_Screen extends StatefulWidget {
  const Email_Screen({super.key});

  @override
  State<Email_Screen> createState() => _Email_ScreenState();
}

class _Email_ScreenState extends State<Email_Screen> {
  final TextEditingController emailController = TextEditingController();
 // final TextEditingController passwordController = TextEditingController();

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
              'Pin Verification',
              style: AppTypography.Heading,
            ),
            SizedBox(height: 8),
            Text(
              'A 6 digit verification pin will send to your\n email address',
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
                InputField(controller: emailController, hintText: 'Mail',),

                CustomBtn(onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                ); },),

                AppRichTextLink(
                  text: "Have account?",
                  linkText: "Sign In",
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PinVerificationScreen(),
                    ),
                  );
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
