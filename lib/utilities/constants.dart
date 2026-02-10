import 'package:flutter/material.dart';

const Color kTaskButton = Colors.black;
const Color kInactiveTaskButton = Color.fromARGB(255, 171, 169, 169);
const Color kactiveTaskButton = Colors.black;

const kListName = TextStyle(
  color: Colors.black,
  fontSize: 25,
  fontWeight: FontWeight.w900,
);

const kAddTaskButton = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const kLableTaskButton = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

const kTitleText = TextStyle(
  color: Colors.black,
  fontSize: 25,
  fontWeight: FontWeight.w800,
);

const kTextField = InputDecoration(
  filled: true,
  fillColor: Color.fromARGB(255, 235, 234, 234),
  hintText: "Search your list",
  hintStyle: TextStyle(color: Color.fromARGB(255, 68, 67, 67)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
