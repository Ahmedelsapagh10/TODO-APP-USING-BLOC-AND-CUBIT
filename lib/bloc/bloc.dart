import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/event.dart';

import 'state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskBlocState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddNewTaskEvent>((event, emit) {
      emit(TaskUpdate([...state.tasks, event.task]));
      taskController.clear();
    });
    on<RemoveTaskEvent>((event, emit) {
      emit(TaskUpdate([...state.tasks]..remove(event.task)));
    });
    on<UpdateTaskEvent>((event, emit) {
      var updatedTasks = state.tasks.map((e) {
        if (e.id == event.task.id) {
          return event.task.copyWith(
            isCompleted: !event.task.isCompleted,
          );
        }
        return e;
      }).toList();

      emit(TaskUpdate(updatedTasks));
    });
  }
  TextEditingController taskController = TextEditingController();
}
