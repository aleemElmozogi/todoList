import 'package:flutter/material.dart';

import '../cubit/todoList/todolist_cubit.dart';
import '../logic/validators.dart';
import '../utils/app_colors.dart';
import '../utils/app_string.dart';
import '../utils/app_text_style.dart';
import '../utils/constent.dart';
import 'my_text_field.dart';

class MyBottomSheetDesign extends StatefulWidget {
  MyBottomSheetDesign({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.todolistCubitProvider,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TodolistCubit todolistCubitProvider;

  @override
  State<MyBottomSheetDesign> createState() => _MyBottomSheetDesignState();
}

class _MyBottomSheetDesignState extends State<MyBottomSheetDesign> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.addTitle,
                    style: AppTextStyle.mainTextP,
                  ),
                  SizedBox(height: 5),
                  MyTextFormField(
                    hintTextTitle: AppString.titleHintText,
                    myController: widget.titleController,
                    validatorText: 'يجب أن يكون العنوان باللغة العربية',
                    validatorFunction: textValidator(
                        widget.titleController.text, arabicLettersRegex),
                  ),
                  SizedBox(height: 5),
                  Text(
                    AppString.descriptionTitle,
                    style: AppTextStyle.mainTextP,
                  ),
                  SizedBox(height: 5),
                  MyTextFormField(
                    hintTextTitle: AppString.descriptionHintText,
                    myController: widget.descriptionController,
                    validatorText:
                        'يجب ان يكون الوصف أكبر من صفر وأصغر من أو يساوي عشرين',
                    validatorFunction: textValidator(
                        widget.descriptionController.text, numberRegex),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else if (widget.titleController.text.isNotEmpty) {
                            Navigator.pop(context);
                            return widget.todolistCubitProvider.addTodo(
                              widget.titleController.text,
                              widget.descriptionController.text,
                              false,
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppString.add,
                            style: AppTextStyle.secendryText,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                        ),
                        onPressed: () {
                          widget.titleController.clear();
                          widget.descriptionController.clear();
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppString.cancel,
                            style: AppTextStyle.secendryText,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
