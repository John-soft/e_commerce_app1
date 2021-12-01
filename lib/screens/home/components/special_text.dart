import 'package:flutter/material.dart';

class SpecialText extends StatelessWidget {
  final String text1, text2;
  const SpecialText({Key? key, required this.text1, required this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Text(text2, style: TextStyle(fontSize: 15, color: Colors.grey),)
      ],
    );
  }
}
