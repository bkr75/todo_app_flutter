import 'package:flutter/material.dart';
import 'package:to_do/screens/tasksPage.dart';
import '../utilities/constans.dart';
import 'package:to_do/model/listsModel.dart';
import 'package:to_do/data/emptyLists.dart';
import 'package:to_do/data/listItem.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});
  Widget listCondition() {
    if (list.isEmpty) {
      return EmptyLists();
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: list.map((item) {
            return ListItem(list: item, task: item);
          }).toList(),
        ),
      );
    }
  }

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
              TextField(decoration: kTextField),
              Expanded(child: listCondition()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TasksPage();
                          },
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
