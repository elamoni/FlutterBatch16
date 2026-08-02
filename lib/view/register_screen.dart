import 'package:flutter/material.dart';

import '../core/style/color.dart';
import '../core/style/typography.dart';
import '../widgets/custom_btn.dart';
import '../widgets/input_field.dart';
import '../widgets/input_title.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 72,right: 72,top: 24),
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Text("Register",
                style: AppTypography.mainHeading),
              
                      SizedBox(height: 40,),
                  const InputTitle(
                    lebel: 'Enter your Mobile Number',
                  ),
                  const InputField(
                    hintText: '76485749',
                    suffixIcon: Icons.check_circle,
                    keyboardType: TextInputType.phone,
                  ),
              
                  const InputTitle(
                    lebel: 'Enter Mail Address',
                  ),
                  const InputField(
                    hintText: ' Mail',
              
                    //keyboardType: TextInputType.phone,
                  ),
                  const InputTitle(
                    lebel: 'Password',
                  ),
                  const InputField(
                    hintText: 'Enter Password',
                    isPassword: true,
                    keyboardType: TextInputType.phone,
                  ),
              
                  const InputTitle(
                    lebel: 'Re-Enter Password',
                  ),
                  const InputField(
                    hintText: 'Again Password',
                      isPassword: true,
                    //suffixIcon: Icons.visibility,
                    keyboardType: TextInputType.phone,
                  ),
              
                  CustomBtn(text: 'Submit',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Success');
                      }
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      Text('Dont have an account?'),
                      InkWell(
                          child: Text('SignIn')
                          ),
                    ],
                  ),
                  CustomBtn(text: 'Continue with Google',
                    imagePath: 'assets/images/google.png',
                    btnBackgroundColor: AppColors.iconBtnBG, textColor: Colors.black,
                    borderColor: AppColors.iconBtnBorder,
                  ),
                  CustomBtn(text: 'Continue with Google',
                    imagePath: 'assets/images/apple.png',
                    btnBackgroundColor: AppColors.iconBtnBG, textColor: Colors.black,
                    borderColor: AppColors.iconBtnBorder,
                  ),
              
              
              
              
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
