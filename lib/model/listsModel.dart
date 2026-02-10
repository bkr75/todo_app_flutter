import 'package:to_do/model/tasksModel.dart';
import '../utilities/labelsType.dart';

class ListsModel {
  final String id;
  final String listName;
  final labelType type;
  final String nameLabel;

  ListsModel({
    required this.id,
    required this.listName,
    required this.type,
    required this.nameLabel,
  });
}

final List<ListsModel> list = [
  ListsModel(
    id: '1',
    listName: 'Daily To-do’s',
    nameLabel: 'Work',
    type: labelType.Work,
  ),
  ListsModel(
    id: '2',
    listName: 'Expenditure List',
    nameLabel: 'Finance',
    type: labelType.Finance,
  ),
  ListsModel(
    id: '3',
    listName: 'Family',
    nameLabel: 'Pensonal',
    type: labelType.personal,
  ),
  ListsModel(
    id: '4',
    listName: 'Gym',
    nameLabel: 'Other',
    type: labelType.Other,
  ),
];
