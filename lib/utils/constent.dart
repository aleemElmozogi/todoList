
import 'package:flutter/cupertino.dart';

const BorderRadius borderRadius = BorderRadius.all(
  Radius.circular(10),
);
final RegExp arabicLettersRegex = RegExp(r'^[ْء-ي- ]+$');
final RegExp numberRegex =  RegExp(r'^[0-2][1-9]{1}$');
