part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTask;
  final List<Task> completedTask;
  final List<Task> favoriteTask;
  final List<Task> removedTask;
  const TaskState({
    this.pendingTask = const <Task>[],
    this.removedTask = const <Task>[],
    this.completedTask = const <Task>[],
    this.favoriteTask = const <Task>[],
  });

  @override
  List<Object> get props => [pendingTask, removedTask,favoriteTask,completedTask];

  Map<String, dynamic> toMap() {
    return {
      'allTask': pendingTask.map((x) => x.toMap()).toList(),
      'removedTask': pendingTask.map((x) => x.toMap()).toList(),
      'completedTask': completedTask.map((x) => x.toMap()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTask: List<Task>.from(map['allTask']?.map((x) => Task.fromMap(x))),
      removedTask:
          List<Task>.from(map['removedTask']?.map((x) => Task.fromMap(x))),
           completedTask: List<Task>.from(map['completedTask']?.map((x) => Task.fromMap(x))),
            favoriteTask: List<Task>.from(map['favoriteTask']?.map((x) => Task.fromMap(x))),
    );
  }
}
