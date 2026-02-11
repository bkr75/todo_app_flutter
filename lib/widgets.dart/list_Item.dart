import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:to_do/model/list_model.dart';
import 'package:to_do/utilities/labelsType.dart';

class ListItem extends StatelessWidget {
  final ListsModel list;
  final VoidCallback onPressed;
  const ListItem({super.key, required this.list, required this.onPressed});
  Color listsColor() {
    if (list.type == labelType.Work) {
      return Color(0xFFFFF6E7);
    } else if (list.type == labelType.Finance) {
      return Color(0xFFF3E4F6);
    } else if (list.type == labelType.personal) {
      return const Color.fromARGB(255, 198, 242, 249);
    } else {
      return Color(0xFFE5FFE6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: listsColor(),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(list.listName, style: kListName),
            LabelsType(
              labelName: list.typeIndex == null
                  ? 'No label'
                  : labelType.values[list.typeIndex!].name,
              labelColor: kactiveTaskButton,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
