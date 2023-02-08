import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inject/config/themes/app_themes.dart';
import 'package:inject/utils/app_string.dart';
import 'cubit_observer.dart';
import 'cubit/todolist_cubit.dart';
import 'screens/todo_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appTitle,
      theme: AppTheme.appTheme,
      home: BlocProvider(
        create: (_) => TodolistCubit(),
        child: const MyHomePage(title: AppString.appTitle),
      ),
    );
  }
}
//  BlocProvider(
//         create: (_) => CounterCubit(),
//         child: const MyHomePage(title: 'title'),
//       )