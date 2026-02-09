class TaskModel {
  final String id;
  final String listId;
  final String taskTitle;
  final bool isDone;

  TaskModel({
    required this.id,
    required this.isDone,
    required this.listId,
    required this.taskTitle,
  });
}

final List<TaskModel> task = [
  TaskModel(id: '1', isDone: false, listId: '1', taskTitle: 'Push day'),
  TaskModel(id: '2', isDone: false, listId: '2', taskTitle: 'loundry day'),
  TaskModel(id: '3', isDone: false, listId: '3', taskTitle: 'business day'),
];
