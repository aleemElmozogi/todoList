
part of 'todolist_cubit.dart';

@freezed
class TodolistState with _$TodolistState {
  const factory TodolistState.initial() = _Initial;
  const factory TodolistState.loaded() = _Loaded;
}
