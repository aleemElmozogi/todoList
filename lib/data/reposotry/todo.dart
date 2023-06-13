// import 'package:mongo_dart/mongo_dart.dart';
//
// import '../model/todo.dart';
//
// class TodoRepository {
//   late final Db _db;
//   late final DbCollection _collection;
//
//   TodoRepository() {
//     _db = Db('mongodb://localhost:27017/todo');
//     _collection = _db.collection('todos');
//   }
//
//   Future<void> connect() async {
//     await _db.open();
//   }
//
//   Future<void> create(Todo todo) async {
//     await _collection.insertOne({
//       'title': todo.title,
//       'isCompleted': todo.isChecked,
//     });
//   }
//
//   Future<List<Todo>> read() async {
//     final cursor = _collection.find();
//     final todos = await cursor
//         .map((doc) => Todo(
//               title: doc['title'],
//               isChecked: doc['isChecked'],
//               description: doc['description'],
//             ))
//         .toList();
//
//     return todos;
//   }
//
//   Future<void> update(Todo todo) async {
//     await _collection.updateOne(
//       where.eq('title', todo.title),
//       modify.set('isCompleted', todo.isChecked),
//     );
//   }
//
//   Future<void> delete(Todo todo) async {
//     await _collection.deleteOne({
//       'title': todo.title,
//     });
//   }
//
//   Future<void> close() async {
//     await _db.close();
//   }
// }
