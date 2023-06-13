// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:inject/utils/app_colors.dart';
// import 'package:inject/widgets/add_button.dart';
// import 'package:inject/widgets/my_todo_container.dart';
// import '../cubit/mongo_db_cubit.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             widget.title,
//           ),
//         ),
//         backgroundColor: AppColors.primaryColor,
//       ),
//       body: Center(
//         child: BlocConsumer<TodolistCubit, TodolistState>(
//           builder: (context, todolistState) {
//             print('line: 34');
//             print('watch: ${context.read<TodolistCubit>().getTodosLength}');
//             return Stack(
//               children: [
//                 Center(
//                   child: ListView(
//                     children: [
//                       Center(
//                         child: Text(
//                             '{context.watch<todolistState>().getTodos.last}'),
//                       ),
//                       Center(
//                         child: Text(
//                             '${context.read<TodolistCubit>().getTodosLength}'),
//                       ),
//                     ],
//                   ),
//                 ),
//                 AddButton(
//                   addTodo: TodolistCubit(),
//                 )
//               ],
//             );
//           },
//           listenWhen: (previous, current) => previous == current ? true : false,
//           listener: (_, TodolistState) {
//             context.read<TodolistCubit>().todoWidgets.add(MyTodo(
//               title: '',
//               description: '',
//               isChecked: true,
//             ));
//           },
//         ),
//       ),
//     );
//   }
// }
// // Stack(
// // children: [
// // Center(
// // child: ListView(
// // children: [
// // Center(
// // child: Text(
// // '{context.watch<todolistState>().getTodos.last}'),
// // ),
// // Center(
// // child: Text(
// // '${context.read<TodolistCubit>().getTodosLength}'),
// // ),
// // ],
// // ),
// // ),
// // AddButton(
// // addTodo: TodolistCubit(),
// // )
// // ],
// // );
