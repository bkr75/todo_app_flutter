import 'package:flutter/material.dart';
import 'package:to_do/screens/tasksPage.dart';
import '../utilities/constants.dart';
import 'package:to_do/model/list_model.dart';
import 'package:to_do/widgets.dart/emptyLists.dart';
import 'package:to_do/widgets.dart/list_Item.dart';
import 'package:to_do/utilities/labelsType.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  Widget listCondition() {
    if (list.isEmpty) {
      return EmptyLists();
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: list.map((item) {
            return ListItem(
              list: item,
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TasksPage(
                      reciveListId: item.id,
                      reciveListName: item.listName,
                    ),
                  ),
                );
                setState(() {});
              },
            );
          }).toList(),
        ),
      );
    }
  }

  final TextEditingController _nameController = TextEditingController();
  labelType _selectedType = labelType.Work;

  String _newId() => DateTime.now().microsecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('ToDo', style: kTitleText),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(controller: _nameController, decoration: kTextField),
              Expanded(child: listCondition()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      final newList = ListsModel(
                        id: _newId(),
                        listName: 'New list',
                        nameLabel: _selectedType.name,
                      );

                      setState(() {
                        list.add(newList);
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TasksPage(
                            reciveListId: newList.id,
                            reciveListName: newList.listName,
                          ),
                        ),
                      );
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add, color: Colors.white),
                    backgroundColor: Colors.black,
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
