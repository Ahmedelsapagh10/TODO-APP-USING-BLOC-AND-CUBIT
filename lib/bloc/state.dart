import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/models/task_model.dart';

abstract class TaskBlocState extends Equatable {
  final List<TaskModel> tasks;
  const TaskBlocState(this.tasks);
  @override
  List<Object?> get props => [tasks];
}

class TaskInitial extends TaskBlocState {
  TaskInitial() : super([]);
}

class TaskUpdate extends TaskBlocState {
  const TaskUpdate(List<TaskModel> tasks) : super(tasks);
}
