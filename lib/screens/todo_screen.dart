import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inject/utils/app_colors.dart';
import 'package:inject/widgets/add_button.dart';
import '../cubit/todolist_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: BlocConsumer<TodolistCubit, TodolistState>(
          listenWhen: (previous, current) => previous == current ? true : false,
          listener: (_, TodolistState) {},

          builder: (context, todolistState) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: context.read<TodolistCubit>().todoWidgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return index !=
                            context.read<TodolistCubit>().getTodosLength - 1
                        ? context.read<TodolistCubit>().todoWidgets[index]
                        : Padding(
                            padding: EdgeInsets.only(bottom: 65),
                            child: context
                                .read<TodolistCubit>()
                                .todoWidgets[index],
                          );
                  },
                ),
                AddButton(
                  todolistCubitProvider: context.read<TodolistCubit>(),
                ),
              ],
            );
          },
        ));
  }
}
