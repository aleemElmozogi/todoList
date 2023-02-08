// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String title,
    required String description,
    required bool isChecked,
  }) = _Todo;
}
