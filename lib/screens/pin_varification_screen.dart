import 'package:flutter/material.dart';
import 'package:task_manager/widgets/screen_BG.dart';

import '../core/typography.dart';
import '../widgets/appRichTextLink.dart';
import '../widgets/custom_btn.dart';
import 'login_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(child: Padding(
        padding: const EdgeInsets.only(left: 62,right: 62,),
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

            SizedBox(height: 32,),

            Form(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 45,
                  height: 48,
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: '',
                      // নিচে ডিজিট কাউন্টার রিমুভ করার জন্য
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Colors.green, width: 1.5),
                      ),
                    ),),
                )   ;
              }        ,



            ),

            ),),
            CustomBtn(onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ); },),

            AppRichTextLink(
              text: "Have account?",
              linkText: "Sign In",
              onTap: () {
                // Navigate to Sign up
              },
            ),

          ],
        ),
      )),
    );
  }
}
