import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/taskBloc/index.dart';
import '../models/index.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);
  
TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Создать задачу',
            style: TextStyle(fontSize: 24),
          ),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              label: Text('Название'),
              border: OutlineInputBorder(),
            ),
            controller: titleController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('отменить')),
                  ElevatedButton(
              onPressed: () {
                var task = Task(title: titleController.text);
                context.read<TaskBloc>().add(AddTaskEvent(task: task));
                Navigator.pop(context);
              },
              child: const Text('Добавить')),
            ],
          ),
          
        ],
      ),
    );
  }
}
