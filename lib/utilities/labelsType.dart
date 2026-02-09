import 'package:flutter/material.dart';
import 'package:to_do/utilities/constans.dart';

enum labelType { personal, Work, Finance, Other }

class LabelsType extends StatelessWidget {
  LabelsType({
    super.key,
    required this.labelName,
    required this.labelColor,
    required this.onPressed,
  });

  final String labelName;
  final Color labelColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: labelColor,
        ),
        child: Center(child: Text(labelName, style: kLableTaskButton)),
      ),
    );
  }
}
