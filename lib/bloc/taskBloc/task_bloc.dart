import 'package:equatable/equatable.dart';
import 'package:flutter_application_bloc_tasks/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(_onAddTask);
    on<UppdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteEvent);
    on<RemoveTaskEvent>(_onRemoveEvent);
  }

  void _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTask: List.from(state.pendingTask)..add(event.task),
        completedTask: state.completedTask,
        favoriteTask: state.favoriteTask,
        removedTask: state.removedTask));
  }

  void _onUpdateTask(UppdateTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> pendingTask = state.pendingTask;
    List<Task> completedTask= state.completedTask;

    task.isDone == false
        ? pendingTask .insert(0, task.copyWith(isDone: true))
        : completedTask.insert(0, task.copyWith(isDone: false));

    emit(TaskState(pendingTask: pendingTask, removedTask: state.removedTask));
  }

  void _onDeleteEvent(DeleteTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTask: state.pendingTask,
        removedTask: List.from(state.removedTask)..remove(event.task)));
  }

  void _onRemoveEvent(RemoveTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTask: List.from(state.pendingTask)..remove(event.task),
        removedTask: List.from(state.removedTask)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
