import 'package:flutter/material.dart';
import 'package:to_do/utilities/constans.dart';
import '../utilities/labelsType.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  labelType? selectedLable;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          taskButtons(buttonHeight: 40, buttonName: 'save', buttonWidth: 80),
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
                    Text('Title', style: kTitleText),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text('to do', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    taskButtons(
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
                        Text('Choose a lable', style: kTitleText),
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

class taskButtons extends StatelessWidget {
  const taskButtons({
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
