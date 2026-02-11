// class TaskModel {
//   final String id;
//   final String listId;
//   final String taskTitle;
//   final bool isDone;

//   TaskModel({
//     required this.id,
//     required this.isDone,
//     required this.listId,
//     required this.taskTitle,
//   });
// }

// final List<TaskModel> task = [
//   TaskModel(id: '1', isDone: false, listId: '1', taskTitle: 'Push day'),
//   TaskModel(id: '2', isDone: false, listId: '2', taskTitle: 'loundry day'),
//   TaskModel(id: '3', isDone: false, listId: '3', taskTitle: 'business day'),
// ];

import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String listId;

  @HiveField(2)
  final String taskTitle;

  @HiveField(3)
  final bool isDone;

  TaskModel({
    required this.id,
    required this.listId,
    required this.taskTitle,
    required this.isDone,
  });

  TaskModel copyWith({bool? isDone, String? taskTitle}) {
    return TaskModel(
      id: id,
      listId: listId,
      taskTitle: taskTitle ?? this.taskTitle,
      isDone: isDone ?? this.isDone,
    );
  }
}
