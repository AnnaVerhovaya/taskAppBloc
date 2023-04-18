import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/taskBloc/index.dart';
import '../models/index.dart';


class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTaskEvent(task: task))
        : context.read<TaskBloc>().add(RemoveTaskEvent(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: (value) {
          context.read<TaskBloc>().add(UppdateTaskEvent(task: task));
        },
        value: task.isDone,
      ),
      onLongPress: () =>
         _removeOrDeleteTask(context, task),
    );
  }
}
