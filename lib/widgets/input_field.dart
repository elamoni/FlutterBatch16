import 'package:flutter/material.dart';


class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  //final bool isReadOnly;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType,
    this.validator,
    this.maxLines = 1,
    //this.isReadOnly = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  //bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     controller: widget.controller,
      //obscureText: widget.isPassword ? _obscureText : false,
      keyboardType:widget.keyboardType,
      maxLines: widget.isPassword ? 1:widget.maxLines,
      //readOnly: widget.isReadOnly,
      validator: widget.validator,

      decoration: InputDecoration(
        hintText: widget.hintText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),


      ),
    );
  }
}
