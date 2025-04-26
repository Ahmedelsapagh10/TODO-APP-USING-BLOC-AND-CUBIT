import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/models/task_model.dart';

abstract class TaskState extends Equatable {
  final List<TaskModel> tasks;
  const TaskState(this.tasks);
  @override
  List<Object?> get props => [tasks];
}

class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

class TaskUpdate extends TaskState {
  const TaskUpdate(List<TaskModel> tasks) : super(tasks);
}
