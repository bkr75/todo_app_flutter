import '../utilities/labelsType.dart';
import 'package:hive/hive.dart';

part 'list_model.g.dart';

@HiveType(typeId: 2)
class ListsModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String listName;

  @HiveField(2)
  final int? typeIndex;

  ListsModel({
    required this.id,
    required this.listName,
    this.typeIndex,
  });

  labelType? get type => typeIndex == null ? null : labelType.values[typeIndex!];

  ListsModel copyWith({
    String? id,
    String? listName,
    labelType? type,
  }) {
    return ListsModel(
      id: id ?? this.id,
      listName: listName ?? this.listName,
      typeIndex: type == null ? typeIndex : type.index,
    );
  }
}


// class ListsModel {
//   final String id;
//   final String listName;
//   final labelType? type;
//   final String nameLabel;

//   ListsModel({
//     required this.id,
//     required this.listName,
//     this.type,
//     required this.nameLabel,
//   });

//   ListsModel copyWith({
//     String? id,
//     String? listName,
//     labelType? type,
//     String? nameLabel,
//   }) {
//     return ListsModel(
//       id: id ?? this.id,
//       listName: listName ?? this.listName,
//       type: type ?? this.type,
//       nameLabel: nameLabel ?? this.nameLabel,
//     );
//   }
// }

// final List<ListsModel> list = [
//   ListsModel(
//     id: '1',
//     listName: 'Daily To-do’s',
//     nameLabel: 'Work',
//     type: labelType.Work,
//   ),
//   ListsModel(
//     id: '2',
//     listName: 'Expenditure List',
//     nameLabel: 'Finance',
//     type: labelType.Finance,
//   ),
//   ListsModel(
//     id: '3',
//     listName: 'Family',
//     nameLabel: 'Pensonal',
//     type: labelType.personal,
//   ),
//   ListsModel(
//     id: '4',
//     listName: 'Gym',
//     nameLabel: 'Other',
//     type: labelType.Other,
//   ),
// ];
