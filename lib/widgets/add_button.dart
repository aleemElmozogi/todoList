import 'package:flutter/material.dart';
import 'package:inject/utils/app_colors.dart';
import '../cubit/todolist_cubit.dart';
import '../utils/constent.dart';
import 'my_bottom_sheet.dart';

class AddButton extends StatelessWidget {
  AddButton({
    super.key,
    required this.todolistCubitProvider,
  });
  final TodolistCubit todolistCubitProvider;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
        child: SizedBox(
          height: 60,
          width: 60,
          child: Material(
            elevation: 5,
            borderRadius: borderRadius,
            color: AppColors.seccondryColor,
            child: MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.0),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: MyBottomSheetDesign(
                            titleController: titleController,
                            descriptionController: descriptionController,
                            todolistCubitProvider: todolistCubitProvider),
                      );
                    });
              },
              child: Center(
                child: Icon(
                  Icons.add,
                  color: AppColors.mainColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
