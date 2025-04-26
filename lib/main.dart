import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/bloc.dart';
import 'package:flutter_bloc_app/bloc/event.dart';
import 'package:flutter_bloc_app/bloc/state.dart';
import 'package:flutter_bloc_app/cubit/cubit.dart';

import 'cubit/state.dart';
import 'models/task_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int i = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: BlocBuilder<TaskBloc, TaskBlocState>(
        builder: (context, state) {
          var cubit = context.read<TaskBloc>();
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: cubit.taskController,
                    decoration: InputDecoration(
                      hintText: "Enter Task",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cubit.add(AddNewTaskEvent(
                          TaskModel(
                            title: cubit.taskController.text,
                            isCompleted: false,
                            id: (i++).toString(),
                          ),
                        ));
                      },
                      child: const Text("Add Task")),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                      child: state.tasks.isEmpty
                          ? const Center(
                              child: Text("No Tasks"),
                            )
                          : ListView.builder(
                              itemCount: state.tasks.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(state.tasks[index].title),
                                  trailing: IconButton(
                                    onPressed: () {
                                      cubit.add(
                                          RemoveTaskEvent(state.tasks[index]));
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                  leading: Checkbox(
                                    value: state.tasks[index].isCompleted,
                                    onChanged: (value) {
                                      cubit.add(
                                          UpdateTaskEvent(state.tasks[index]));
                                    },
                                  ),
                                );
                              },
                            ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
