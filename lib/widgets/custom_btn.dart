import 'package:flutter/material.dart';
import 'package:task_manager/core/color.dart';

class CustomBtn extends StatefulWidget {
  final String? title;
  //final IconData? icon;
  final VoidCallback onPressed;

  const CustomBtn({

    super.key, this.title, required this.onPressed});

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,bottom: 24),
      child: SizedBox(
        height: 40,width: double.infinity,
        child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.customBTN, // Green color from UI
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            onPressed: widget.onPressed,
            child: _buildChild(),
        ),
      ),
    );
  }


  // Icon অথবা Title থাকলে কোনটা দেখাবে তা হ্যান্ডেল করার নিয়ম
  Widget _buildChild() {
    if (widget.title!= null){
      return Text(widget.title!);
    }
    else{return Icon(
      Icons.arrow_circle_right_outlined, // ফিক্সড আইকন
      size: 24,
      color: Colors.white,
    );
    }


  }
}
