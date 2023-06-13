import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../data/model/todo.dart';
import '../../utils/app_mongodb.dart';
import 'mongo_db_state.dart';

@Injectable()
class MongoDbCubit extends Cubit<MongoDbState> {
  MongoDbCubit()
      : super(
          MongoDbState(
            db: Db(AppMongodbData.url),
            collection: Db(AppMongodbData.url)
                .collection(AppMongodbData.collectionName),
          ),
        ) {
    connect();
  }
  void connect() async {
    emit(state.copyWith(db: await Db.create(AppMongodbData.url)));

    await state.db.open();
  }

  Future<void> create(Todo todo) async {
    /// ---
    await state.collection.insertOne({
      'title': todo.title,
      'description': todo.description,
      'isCompleted': todo.isChecked,
    });
    close();
  }

  Future<List<Todo>> read() async {
    final cursor = state.collection.find();

    /// ---
    final todos = await cursor
        .map((doc) => Todo(
              title: doc['title'],
              isChecked: doc['isCompleted'],
              description: doc['description'],
            ))
        .toList();
    close();

    return todos;
  }

  Future<void> update(Todo todo) async {
    /// ---
    await state.collection.updateOne(
      where.eq('title', todo.title),
      modify.set(
        'isCompleted',
        todo.isChecked,
      ),
    );
    close();
  }

  Future<void> delete(Todo todo) async {
    /// ---
    await state.collection.deleteMany({
      'title': todo.title,
    });
    close();
  }

  Future<void> close() async {
    await state.db.close();
  }
}
