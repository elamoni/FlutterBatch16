import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppRichTextLink extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;

  const AppRichTextLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
        ),
        children: [
          TextSpan(text: "$text "),
          TextSpan(
            text: linkText,
            style: const TextStyle(
              color: Color(0xFF1CB86E), // Green theme color
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}