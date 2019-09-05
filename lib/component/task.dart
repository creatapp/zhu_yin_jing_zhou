import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  @override
  TaskState createState() => TaskState();
}

class TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Task'),);
  }
}