import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inject/model/todo.dart';

import '../widgets/my_todo_container.dart';

part 'todolist_state.dart';
part 'todolist_cubit.freezed.dart';

class TodolistCubit extends Cubit<TodolistState> {
  TodolistCubit() : super(TodolistState.initial());
  List<Widget> todoWidgets = [];
  List<Todo> todos = [];
  int get getTodosLength => todoWidgets.length;

  void doneTask(int index) {
    emit(TodolistState.initial());
    todos[index] = todos[index].copyWith(isChecked: !todos[index].isChecked);
    todoWidgets[index] = MyTodo(
      todo: todos[index],
      doneTask: () => doneTask(index),
      removeTask: () => removeTask(index),
      index: index,
    );
    emit(TodolistState.loaded());
  }

  void removeTask(int index) {
    print('line 30: $index');
    emit(TodolistState.initial());
    todos.removeAt(index);
    todoWidgets.removeAt(index);
    for (var x = index; x < todos.length; x++) {
      print('${todos[x].description}');
      todoWidgets[x] = MyTodo(
        todo: todos[x],
        doneTask: () => doneTask(x),
        removeTask: () => removeTask(x),
        index: x,
      );
    }
    emit(TodolistState.loaded());
  }

  void addTodo(String _title, String _description, bool _isCheacked) {
    Todo newTodo = Todo(
        title: '$_title', description: '$_description', isChecked: _isCheacked);
    int index = todoWidgets.length;
    print(index);
    emit(TodolistState.initial());
    todos.add(newTodo);
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
