import 'package:flutter/material.dart';
import 'package:to_do/screens/listsPage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/model/task_model.dart';
import 'package:to_do/model/list_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<TaskModel>('tasksBox');

  Hive.registerAdapter(ListsModelAdapter());
  await Hive.openBox<ListsModel>('listsBox');


  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListsPage());
  }
}
