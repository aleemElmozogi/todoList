import 'package:mongo_dart/mongo_dart.dart';

import '../../utils/app_mongodb.dart';
import '../model/todo.dart';

class MongodbHelper {
  late final Db _db;
  late final DbCollection _collection;

  MongodbHelper() {
    _db = Db(AppMongodbData.url);
    _collection = _db.collection(AppMongodbData.collectionName);
  }

  static connect() async {
    final Db _db = await Db.create(AppMongodbData.url);
    await _db.open();
  }

  Future<void> create(Todo todo) async {
    final Db _db = await Db.create(AppMongodbData.url);
    final DbCollection _collection =
        _db.collection(AppMongodbData.collectionName);
    await _db.open();

    /// ---
    await _collection.insertOne({
      'title': todo.title,
      'description': todo.description,
      'isCompleted': todo.isChecked,
    });
    close();
  }

  Future<List<Todo>> read() async {
    final Db _db = await Db.create(AppMongodbData.url);
    final DbCollection _collection =
        _db.collection(AppMongodbData.collectionName);
    await _db.open();

    final cursor = _collection.find();

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
    final Db _db = await Db.create(AppMongodbData.url);
    final DbCollection _collection =
        _db.collection(AppMongodbData.collectionName);
    await _db.open();

    /// ---
    await _collection.updateOne(
      where.eq('title', todo.title),
      modify.set(
        'isCompleted',
        todo.isChecked,
      ),
    );
    close();
  }

  Future<void> delete(Todo todo) async {
    final Db _db = await Db.create(AppMongodbData.url);
    final DbCollection _collection =
        _db.collection(AppMongodbData.collectionName);
    await _db.open();

    /// ---
    await _collection.deleteMany({
      'title': todo.title,
    });
    close();
  }

  Future<void> close() async {
    await _db.close();
  }
}
