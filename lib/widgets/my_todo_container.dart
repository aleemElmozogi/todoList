import 'package:flutter/material.dart';
import 'package:inject/utils/app_colors.dart';
import 'package:inject/utils/app_text_style.dart';

import '../data/model/todo.dart';
import '../utils/constent.dart';

class MyTodo extends StatelessWidget {
  MyTodo({
    super.key,
    required this.todo,
    required this.doneTask,
    required this.removeTask,
    required this.index,
  });
  final doneTask;
  final removeTask;
  final Todo todo;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        child: Material(
            elevation: 2,
            borderRadius: borderRadius,
            color: AppColors.primaryColor,
            child: MaterialButton(
              onPressed: () => doneTask(),
              onLongPress: () => removeTask(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            todo.title,
                            style: AppTextStyle.mainText,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            todo.description,
                            style: AppTextStyle.secendryText,
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 15,
                    // ),
                    SizedBox(
                      width: 10,
                      child: Checkbox(
                        value: todo.isChecked,
                        checkColor: AppColors.primaryColor,
                        onChanged: (v) {
                          doneTask();
                        },
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.mainColor),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
