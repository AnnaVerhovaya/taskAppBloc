import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/swichBloc/index.dart';
import '../bloc/taskBloc/index.dart';
import '../screens/index.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              color: Colors.grey,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Text(
                'Ящик задач',
                style: Theme.of(context).textTheme.headline5,
              )),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(CompletedTaskScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('Мои задачи'),
                  trailing: Text('${state.pendingTask.length}'),
                ),
              );
            },
          ),
          const Divider(
            height: 50,
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Корзина'),
                  trailing: Text('${state.removedTask.length}'),
                ),
              );
            },
          ),
          BlocBuilder<SwichBloc, SwichState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: ((value) {
                    value
                        ? context.read<SwichBloc>().add(SwichOnEvent())
                        : context.read<SwichBloc>().add(SwichOffEvent());
                  }));
            },
          ),
        ],
      ),
    );
  }
}
