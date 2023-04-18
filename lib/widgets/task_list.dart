import 'package:flutter/material.dart';
import '../models/index.dart';
import 'index.dart';


class ListTasks extends StatelessWidget {
  const ListTasks({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: taskList.length,
          itemBuilder: ((context, index) {
            var task = taskList[index];
            return TaskTile(task: task);
          })),
    );
  }
}

