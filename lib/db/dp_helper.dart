// import 'package:sqflite/sqflite.dart';
//
// import '../models/task.dart';
//
// class DBHelper{
//
//   static Database? _db;
//   static final int _version=1;
//   static final String _tableName="tasks";
//
//   static Future<void> initDb() async {
//     if (_db != null) {
//       return;
//     }
//     try {
//       String _path = await getDatabasesPath() + 'task.db';
//       _db = await openDatabase(_path,
//         version: _version,
//         onCreate: (db, version) {
//           print("Creating a new one");
//           return db.execute(
//             "CREATE TABLE $_tableName("
//                 "id INTEGER PRIMARY KEY AUTOINCREMENT, "
//                 "title STRING, note TEXT, data STRING, "
//                 "remind INTEGER)",
//
//
//           );
//         },
//       );
//     }
//     catch (e) {
//       print(e);
//     }
//   }
// static Future <int> insert (Task? task)async {
//
// print("insert function called");
// return await _db?.insert(_tableName, task!.toJson())??1;
//
// }
// static Future<List<Map<String,dynamic>>> query()async{
//     print("query function called");
//     return await _db!.query(_tableName);
//
// }
//     }
import 'package:sqflite/sqflite.dart' as sql;

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        note TEXT,
        date TEXT,
        remind INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }


  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'MyDataBase.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String title, String? note,String? date,int? remind) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'note': note , 'date':date , 'remind':remind};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String title,  String? note,String? date,int? remind) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'note': note ,
      'date':date ,
      'remind':remind,
     // 'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}