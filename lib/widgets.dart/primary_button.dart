import 'package:flutter/material.dart';
import 'package:to_do/utilities/constants.dart';

class primaryButtons extends StatelessWidget {
  const primaryButtons({
    super.key,
    required this.buttonHeight,
    required this.buttonName,
    required this.buttonWidth,
    required this.onPressed,
  });

  final String buttonName;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: kTaskButton,
        ),
        child: Center(child: Text(buttonName, style: kAddTaskButton)),
      ),
    );
  }
}
