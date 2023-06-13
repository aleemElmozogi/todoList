import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inject/config/themes/app_themes.dart';
import 'package:inject/screens/splash_screen.dart';
import 'package:inject/utils/app_string.dart';

import 'cubit/dbControl/mongo_db_cubit.dart';
import 'cubit/todoList/todolist_cubit.dart';
import 'screens/todo_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppString.appTitle,
        theme: AppTheme.appTheme,
        home: SplashScreen(),
        routes: {
          '/home': (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<TodolistCubit>(
                    create: (BuildContext context) => TodolistCubit(),
                  ),
                  BlocProvider<MongoDbCubit>(
                    create: (BuildContext context) => MongoDbCubit(),
                  ),
                ],
                child: const MyHomePage(title: AppString.appTitle),
              ),
        });
  }
}
