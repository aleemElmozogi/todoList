import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_source/mongodb.dart';
import '../../data/model/todo.dart';
import '../../widgets/my_todo_container.dart';

part 'todolist_cubit.freezed.dart';
part 'todolist_state.dart';

class TodolistCubit extends Cubit<TodolistState> {
  List<Widget> todoWidgets = [];
  List<Todo> todos = [];
  int get getTodosLength => todoWidgets.length;
  final MongodbHelper database = MongodbHelper();
  TodolistCubit() : super(TodolistState.initial()) {
    readTodos();
  }
  Future<void> readTodos() async {
    emit(TodolistState.initial());

    todos = await database.read();
    for (var t = 0; t < todos.length; t++) {
      int index = todoWidgets.length;
      todoWidgets.add(MyTodo(
          todo: todos[t],
          doneTask: () => doneTask(index),
          removeTask: () => removeTask(index),
          index: index));
    }
    emit(TodolistState.loaded());
  }

  Future<void> doneTask(int index) async {
    emit(TodolistState.initial());
    todos[index] = todos[index].copyWith(isChecked: !todos[index].isChecked);
    todoWidgets[index] = MyTodo(
      todo: todos[index],
      doneTask: () => doneTask(index),
      removeTask: () => removeTask(index),
      index: index,
    );
    await database.update(todos[index]);
    emit(TodolistState.loaded());
  }

  Future<void> removeTask(int index) async {
    emit(TodolistState.initial());
    await database.delete(todos[index]);
    todos.removeAt(index);
    todoWidgets.removeAt(index);

    for (var x = index; x < todos.length; x++) {
      todoWidgets[x] = MyTodo(
        todo: todos[x],
        doneTask: () => doneTask(x),
        removeTask: () => removeTask(x),
        index: x,
      );
    }
    emit(TodolistState.loaded());
  }

  Future<void> addTodo(
      String _title, String _description, bool _isCheacked) async {
    Todo newTodo = Todo(
        title: '$_title', description: '$_description', isChecked: _isCheacked);
    int index = todoWidgets.length;
    emit(TodolistState.initial());
    todos.add(newTodo);
    database.create(newTodo);

    todoWidgets.add(
      MyTodo(
        todo: newTodo,
        doneTask: () => doneTask(index),
        removeTask: () => removeTask(index),
        index: index,
      ),
    );
    emit(TodolistState.loaded());
  }
}
