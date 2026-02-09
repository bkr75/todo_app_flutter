import 'package:to_do/model/tasksModel.dart';
import '../utilities/labelsType.dart';

class ListsModel {
  final String id;
  final String listName;
  final labelType type;
  final String nameLabel;
  final List<TaskModel> tasks;

  ListsModel({
    required this.id,
    required this.listName,
    required this.type,
    required this.nameLabel,
    required this.tasks,
  });
}

final List<ListsModel> list = [
  ListsModel(
    id: '1',
    listName: 'Daily To-do’s',
    nameLabel: 'Work',
    type: labelType.Work,
    tasks: task,
  ),
  ListsModel(
    id: '2',
    listName: 'Expenditure List',
    nameLabel: 'Finance',
    type: labelType.Finance,
    tasks: task,
  ),
  ListsModel(
    id: '3',
    listName: 'Family',
    nameLabel: 'Pensonal',
    type: labelType.personal,
    tasks: task,
  ),
  ListsModel(
    id: '4',
    listName: 'Gym',
    nameLabel: 'Other',
    type: labelType.Other,
    tasks: task,
  ),
];
