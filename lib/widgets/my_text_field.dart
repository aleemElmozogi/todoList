import 'package:flutter/material.dart';
import 'package:inject/utils/app_string.dart';

import '../utils/app_colors.dart';
import '../utils/constent.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {Key? key,
      required this.hintTextTitle,
      required this.myController,
      required this.validatorText,
      required this.validatorFunction})
      : super(key: key);
  final String hintTextTitle;
  final TextEditingController myController;
  final String validatorText;
  final bool validatorFunction;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Align(
        alignment: Alignment.center,
        child: TextFormField(
          controller: myController,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          validator: (value) {
            return validatorFunction ? null : validatorText;
          },
          decoration: InputDecoration(
            hintText: hintTextTitle,
            hintStyle: TextStyle(
              fontFamily: AppString.fontFamily,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: const OutlineInputBorder(
              borderRadius: borderRadius,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
              borderRadius: borderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
              borderRadius: borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
