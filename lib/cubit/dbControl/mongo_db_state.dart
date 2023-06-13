import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mongo_dart/mongo_dart.dart';

part 'mongo_db_state.freezed.dart';

@freezed
abstract class MongoDbState with _$MongoDbState {
  factory MongoDbState({
    required Db db,
    required DbCollection collection,
  }) = _MongoDbState;
}
