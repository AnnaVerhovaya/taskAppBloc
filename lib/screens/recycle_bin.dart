import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/taskBloc/index.dart';
import '../widgets/index.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'recycle_bin';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          drawer: SafeArea(
            child: Column(
              children: [
                Container(
                    color: Colors.grey,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Корзина',
                      style: Theme.of(context).textTheme.headline5,
                    )),
                ListTile(
                  leading: Icon(Icons.folder_special),
                  title: Text('Мои задачи'),
                  trailing: Text('${state.removedTask.length}'),
                ),
                const Divider(
                  height: 50,
                ),
                const ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Корзина'),
                  trailing: Text('0'),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('Мои задачи'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Center(
                child: Chip(
                  label: Text('Задача'),
                ),
              ),
              ListTasks(taskList: state.removedTask)
            ],
          ),
        );
      },
    );
  }
}
