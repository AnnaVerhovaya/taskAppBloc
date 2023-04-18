import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/taskBloc/index.dart';
import '../models/index.dart';
import '../widgets/index.dart';

class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTask;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text('${state.pendingTask.length} Дел'),
              ),
            ),
            ListTasks(taskList: taskList),
          ],
        );
      },
    );
  }
}
