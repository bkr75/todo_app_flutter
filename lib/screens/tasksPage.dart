import 'package:flutter/material.dart';
import 'package:to_do/utilities/constans.dart';
import '../utilities/labelsType.dart';
import 'package:to_do/model/tasksModel.dart';

class TasksPage extends StatefulWidget {
  final String reciveListId;
  final String reciveListName;
  const TasksPage({
    super.key,
    required this.reciveListId,
    required this.reciveListName,
  });

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  labelType? selectedLable;

  @override
  Widget build(BuildContext context) {
    final filteredTasks = task
        .where((t) => t.listId == widget.reciveListId && !t.isDone)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          addSaveButton(buttonHeight: 40, buttonName: 'save', buttonWidth: 80),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.reciveListName, style: kTitleText),
                    TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    Expanded(
                      child: filteredTasks.isEmpty
                          ? const Center(child: Text('No tasks yet'))
                          : ListView.builder(
                              itemCount: filteredTasks.length,
                              itemBuilder: (context, index) {
                                final t = filteredTasks[index];

                                return Row(
                                  children: [
                                    Checkbox(
                                      value: t.isDone,
                                      onChanged: (value) {
                                        setState(() {
                                          final i = task.indexWhere(
                                            (x) => x.id == t.id,
                                          );
                                          if (i != -1) {
                                            task[i] = TaskModel(
                                              id: task[i].id,
                                              listId: task[i].listId,
                                              taskTitle: task[i].taskTitle,
                                              isDone: value ?? false,
                                            );
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      t.taskTitle,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.delete),
                                  ],
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    addSaveButton(
                      buttonHeight: 50,
                      buttonName: '+ Add Task',
                      buttonWidth: 150,
                    ),
                    SizedBox(
                      height: 20.0,
                      width: double.infinity,
                      child: Divider(color: Colors.grey),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Choose a label', style: kTitleText),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LabelsType(
                              onPressed: () {
                                setState(() {
                                  selectedLable = labelType.personal;
                                });
                              },
                              labelName: 'Personal',
                              labelColor: selectedLable == labelType.personal
                                  ? kactiveTaskButton
                                  : kInactiveTaskButton,
                            ),
                            LabelsType(
                              onPressed: () {
                                setState(() {
                                  selectedLable = labelType.Work;
                                });
                              },
                              labelName: 'Work',
                              labelColor: selectedLable == labelType.Work
                                  ? kactiveTaskButton
                                  : kInactiveTaskButton,
                            ),
                            LabelsType(
                              onPressed: () {
                                setState(() {
                                  selectedLable = labelType.Finance;
                                });
                              },
                              labelName: 'Finance',
                              labelColor: selectedLable == labelType.Finance
                                  ? kactiveTaskButton
                                  : kInactiveTaskButton,
                            ),
                            LabelsType(
                              onPressed: () {
                                setState(() {
                                  selectedLable = labelType.Other;
                                });
                              },
                              labelName: 'Other',
                              labelColor: selectedLable == labelType.Other
                                  ? kactiveTaskButton
                                  : kInactiveTaskButton,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class addSaveButton extends StatelessWidget {
  const addSaveButton({
    super.key,
    required this.buttonHeight,
    required this.buttonName,
    required this.buttonWidth,
  });

  final String buttonName;
  final double buttonHeight;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5),
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: kTaskButton,
        ),
        child: Center(child: Text(buttonName, style: kAddTaskButton)),
      ),
    );
  }
}
