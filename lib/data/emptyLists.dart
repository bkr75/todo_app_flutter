import 'package:flutter/material.dart';
import '../utilities/constans.dart';

class EmptyLists extends StatelessWidget {
  const EmptyLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage('images/todo.png')),
        SizedBox(height: 40),
        Text('Create your first to-do list...', style: kTitleText),
      ],
    );
  }
}
