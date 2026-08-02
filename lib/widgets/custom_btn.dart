import 'package:flutter/material.dart';


class CustomBtn extends StatelessWidget {
  final String text;
  final String? imagePath;
  final Color btnBackgroundColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const CustomBtn({
    required this.text,
    this.imagePath,
    this.btnBackgroundColor = Colors.black, // Default কালো ব্যাকগ্রাউন্ড
    this.textColor = Colors.white,        // Default সাদা টেক্সট
    this.borderColor,
    this.onPressed,

    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
        backgroundColor: btnBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16),
      side: borderColor!=null?BorderSide(color: borderColor!, width: 1.2):BorderSide.none,
        )
      ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null) ...[
            Image.asset(
              imagePath!,
              width: 22,
              height: 22,
            ),
        const SizedBox(width: 10),
        ],

        Text( text,
        style: TextStyle( color: textColor, fontSize: 16, fontWeight: FontWeight.w600, ),
        ),


        ],
        ),

        ),


      ),
    );
  }
}
