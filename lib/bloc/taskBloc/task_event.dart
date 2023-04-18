part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent  extends TaskEvent {
  final Task task;
  AddTaskEvent ({
    required this.task,
  });
   @override
  List<Object> get props => [task];
}
class UppdateTaskEvent  extends TaskEvent {
  final Task task;
  UppdateTaskEvent ({
    required this.task,
  });
   @override
  List<Object> get props => [task];
}

class DeleteTaskEvent  extends TaskEvent {
  final Task task;
  DeleteTaskEvent ({
    required this.task,
  });
   @override
  List<Object> get props => [task];
}

class RemoveTaskEvent  extends TaskEvent {
  final Task task;
 RemoveTaskEvent ({
    required this.task,
  });
   @override
  List<Object> get props => [task];
}