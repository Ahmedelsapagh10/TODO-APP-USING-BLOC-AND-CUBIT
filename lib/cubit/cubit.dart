import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/state.dart';
import 'package:flutter_bloc_app/models/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  TextEditingController taskController = TextEditingController();
  addNewTask(TaskModel task) {
    emit(TaskUpdate([...state.tasks, task]));
    taskController.clear();
  }

  removeTask(TaskModel task) {
    emit(TaskUpdate([...state.tasks]..remove(task)));
  }

  updateTask(TaskModel task) {
    var updatedTasks = state.tasks.map((e) {
      if (e.id == task.id) {
        return task.copyWith(
          isCompleted: !task.isCompleted,
        );
      }
      return e;
    }).toList();

    emit(TaskUpdate(updatedTasks));
  }
}
