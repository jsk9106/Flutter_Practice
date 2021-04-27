import 'package:flutter/material.dart';

class TwoSentences extends StatelessWidget {
  final String sentence1;
  final String sentence2;
  final GestureTapCallback press;

  const TwoSentences({
    required this.sentence1,
    required this.sentence2,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$sentence1 '),
        GestureDetector(
          onTap: press,
          child: Text(
            sentence2,
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}