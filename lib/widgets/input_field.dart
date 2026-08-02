
import 'package:flutter/material.dart';

import '../core/style/color.dart';

class InputField extends StatefulWidget {
  final String hintText;
   final TextInputType keyboardType;
  final IconData? suffixIcon;
  final bool isPassword;

  const InputField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword= false,

  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {




    return Padding(
      padding: const EdgeInsets.only(top: 6,bottom: 16),
      child: TextFormField(
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          return null;
        },

        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.inputHint,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
  //suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          suffixIcon: widget.isPassword
              ? IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          )
              : widget.suffixIcon == null
              ? null
              : Icon(widget.suffixIcon),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.inputTitle),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.borderFocused,),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
          ),
        ),


      ),
    );
  }
}