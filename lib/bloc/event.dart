import '../models/task_model.dart';

sealed class TaskEvent {}

class AddNewTaskEvent extends TaskEvent {
  final TaskModel task;
  AddNewTaskEvent(this.task);
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel task;
  UpdateTaskEvent(this.task);
}

class RemoveTaskEvent extends TaskEvent {
  final TaskModel task;
  RemoveTaskEvent(this.task);
}
