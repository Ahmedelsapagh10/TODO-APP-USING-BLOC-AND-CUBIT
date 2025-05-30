import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String id;
  final String title;

  final bool isCompleted;

  const TaskModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [id, title, isCompleted];

  TaskModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
