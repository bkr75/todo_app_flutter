import 'package:flutter/material.dart';
import 'package:to_do/model/tasksModel.dart';
import '../utilities/constans.dart';
import 'package:to_do/model/listsModel.dart';
import 'package:to_do/utilities/labelsType.dart';
import 'package:to_do/screens/tasksPage.dart';

// class ListItem extends StatefulWidget {
//   final ListsModel list;

//   const ListItem({super.key, required this.list});

//   @override
//   State<ListItem> createState() => _ListItemState();
// }

// class _ListItemState extends State<ListItem> {
//   Color listsColor() {
//     if (widget.list.type == labelType.Work) {
//       return Color(0xFFFFF6E7);
//     } else if (widget.list.type == labelType.Finance) {
//       return Color(0xFFF3E4F6);
//     } else if (widget.list.type == labelType.personal) {
//       return const Color.fromARGB(255, 198, 242, 249);
//     } else {
//       return Color(0xFFE5FFE6);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         await Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => TasksPage(
//               reciveListId: widget.list.id,
//               reciveListName: widget.list.listName,
//             ),
//           ),
//         );
//         setState(() {});
//       },

//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: listsColor(),
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(widget.list.listName, style: kListName),
//             LabelsType(
//               labelName: widget.list.nameLabel,
//               labelColor: kactiveTaskButton,
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ListItem extends StatelessWidget {
  final ListsModel list;
  final VoidCallback onPressed;
  const ListItem({super.key, required this.list,required this.onPressed});
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
              labelName: list.nameLabel,
              labelColor: kactiveTaskButton,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
