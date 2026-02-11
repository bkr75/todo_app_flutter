import 'package:flutter/material.dart';
import 'package:to_do/utilities/constants.dart';
import 'package:to_do/widgets.dart/primary_button.dart';
import '../utilities/labelsType.dart';
import 'package:to_do/model/task_model.dart';
import 'package:to_do/model/list_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TasksPage extends StatefulWidget {
  final String reciveListId;
  final String reciveListName;
  final int listKey;
  const TasksPage({
    super.key,
    required this.reciveListId,
    required this.reciveListName,
    required this.listKey,
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
      tasksBox.add(
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

  void deleteTask(int key) {
    tasksBox.delete(key);
    setState(() {});
  }

  void updateListLabel(labelType newType) {
    setState(() {
      selectedLable = newType;
    });
    final current = listsBox.get(widget.listKey);
    if (current == null) return;

    listsBox.put(widget.listKey, current.copyWith(type: newType));
  }

  void saveTitle() {
    final newTitle = titleController.text.trim();
    if (newTitle.isEmpty) return;

    final current = listsBox.get(widget.listKey);
    if (current == null) return;

    listsBox.put(widget.listKey, current.copyWith(listName: newTitle));

    setState(() {
      isEditingTitle = false;
    });
  }

  bool isEditingTitle = false;
  late TextEditingController titleController;

  late final Box<TaskModel> tasksBox;
  late final Box<ListsModel> listsBox;
  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box<TaskModel>('tasksBox');
    listsBox = Hive.box<ListsModel>('listsBox');
    final current = listsBox.get(widget.listKey);

    selectedLable = current?.type;

    titleController = TextEditingController(text: current?.listName ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final filteredEntries = tasksBox
        .toMap()
        .entries
        .where((e) => e.value.listId == widget.reciveListId && !e.value.isDone)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          primaryButtons(
            buttonHeight: 40,
            buttonName: 'save',
            buttonWidth: 80,
            onPressed: () {
              Navigator.pop(context);
            },
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
                    // Text(widget.reciveListName,style: kTitleText,),
                    isEditingTitle
                        ? TextField(
                            controller: titleController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            onSubmitted: (_) => saveTitle(),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isEditingTitle = true;
                              });
                            },
                            child: Text(
                              titleController.text,
                              style: kTitleText,
                            ),
                          ),
                    TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    Expanded(
                      child: filteredEntries.isEmpty
                          ? const Center(child: Text('No tasks yet'))
                          : ListView.builder(
                              itemCount: filteredEntries.length,
                              itemBuilder: (context, index) {
                                final entry = filteredEntries[index];
                                final key = entry.key as int;
                                final task = entry.value;

                                return Row(
                                  children: [
                                    Checkbox(
                                      value: task.isDone,
                                      onChanged: (value) {
                                        tasksBox.put(
                                          key,
                                          task.copyWith(isDone: value ?? false),
                                        );
                                        setState(() {});
                                      },
                                    ),
                                    Text(
                                      task.taskTitle,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        deleteTask(key);
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
                    primaryButtons(
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
