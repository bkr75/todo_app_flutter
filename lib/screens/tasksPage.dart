import 'package:flutter/material.dart';
import 'package:to_do/utilities/constans.dart';
import '../utilities/labelsType.dart';
import 'package:to_do/model/tasksModel.dart';
import 'package:to_do/model/listsModel.dart';

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

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void addTask() {
    final title = myController.text.trim();
    if (title.isEmpty) return;

    final newId = DateTime.now().microsecondsSinceEpoch.toString();

    setState(() {
      task.add(
        TaskModel(
          id: newId,
          listId: widget.reciveListId,
          taskTitle: title,
          isDone: false,
        ),
      );
    });

    myController.clear();
  }

  void deleteTask(String taskId) {
    setState(() {
      task.removeWhere((t) => t.id == taskId);
    });
  }

  @override
  void initState() {
    super.initState();

    final current = list.firstWhere(
      (l) => l.id == widget.reciveListId,
      orElse: () => list.first,
    );

    selectedLable = current.type;
  }

  void updateListLabel(labelType newType) {
    setState(() {
      selectedLable = newType;

      final i = list.indexWhere((l) => l.id == widget.reciveListId);
      if (i != -1) {
        list[i] = list[i].copyWith(type: newType, nameLabel: newType.name);
      }
    });
  }

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
          addSaveButton(
            buttonHeight: 40,
            buttonName: 'save',
            buttonWidth: 80,
            onPressed: () {},
          ),
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
                      controller: myController,
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
                                    GestureDetector(
                                      onTap: () {
                                        deleteTask(t.id);
                                      },
                                      child: Icon(Icons.delete),
                                    ),
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
                      onPressed: addTask,
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
                                updateListLabel(labelType.personal);
                              },
                              labelName: 'Personal',
                              labelColor: selectedLable == labelType.personal
                                  ? kactiveTaskButton
                                  : kInactiveTaskButton,
                            ),
                            LabelsType(
                              onPressed: () {
                                updateListLabel(labelType.Work);
                              },
                              labelName: 'Work',
                              labelColor: selectedLable == labelType.Work
                                  ? kactiveTaskButton
                                  : kInactiveTaskButton,
                            ),
                            LabelsType(
                              onPressed: () {
                                updateListLabel(labelType.Finance);
                              },
                              labelName: 'Finance',
                              labelColor: selectedLable == labelType.Finance
                                  ? kactiveTaskButton
                                  : kInactiveTaskButton,
                            ),
                            LabelsType(
                              onPressed: () {
                                updateListLabel(labelType.Other);
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
    required this.onPressed,
  });

  final String buttonName;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
