import 'package:flutter/material.dart';

class RadioButtonWithText extends StatefulWidget {
  RadioButtonWithText({Key? key}) : super(key: key);

  @override
  State<RadioButtonWithText> createState() => _RadioButtonWithTextState();
}

class _RadioButtonWithTextState extends State<RadioButtonWithText> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Title 1'),
        Radio(
          value: isCheck,
          groupValue: 1,
          onChanged: (final index) {
            setState(() {
              isCheck = !isCheck;
            });
          },
        )
      ],
    );
  }
}
