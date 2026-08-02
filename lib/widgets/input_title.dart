import 'package:flutter/material.dart';
class InputTitle extends StatelessWidget {
  final String lebel;

  const InputTitle({
    required this.lebel,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        children: [
          Text (lebel,

      style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),

          ),
        ],
      ),
    );
  }
}
