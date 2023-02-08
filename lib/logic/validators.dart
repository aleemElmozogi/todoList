bool textValidator(String textFieldValue,RegExp regExp) {
  RegExp numValidator = regExp;
  return numValidator.hasMatch(textFieldValue);
}

// bool arabicTextValidator(String textFieldValue) {
//   // 1575 to 1610 is the range of arabic latter's codeUnits
//   // 32 is the space
//   // 9 is the tap
//   if (textFieldValue.length == 0) return false;
//
//   for (var i = 0; i < textFieldValue.length; i++) {
//     if (textFieldValue[i].codeUnitAt(0) < 1575 ||
//         textFieldValue[i].codeUnitAt(0) > 1610) {
//       if (textFieldValue[i].codeUnitAt(0) != 32 &&
//           textFieldValue[i].codeUnitAt(0) != 9) {
//         return false;
//       }
//     }
//   }
//   return true;
// }
//
// if (int.tryParse(textFieldValue) != null) if (int.parse(textFieldValue) <=
// 20 &&
// int.parse(textFieldValue) > 0) {
// return true;
// }
// return false;