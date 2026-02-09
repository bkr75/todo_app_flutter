import 'package:flutter/material.dart';
import 'package:to_do/screens/listsPage.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListsPage());
  }
}
