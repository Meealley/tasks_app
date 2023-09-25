import "package:flutter/material.dart";
import "package:riverpod_todo/common/models/task_model.dart";
import "package:sqflite/sqflite.dart" as sql;

class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      'CREATE TABLE todos('
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "title STRING,  desc TEXT, date STRING,"
      "startTime STRING, endTime STRING,"
      "remind INTEGER, repeat STRING,"
      "isCompleted INTEGER)",
    );
    await database.execute("CREATE TABLE user("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, DEFAULT 0, "
        "isVerified INTEGER)");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("mujinpark", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(Task task) async {
    final db = await DBHelper.db();
    final id = await db.insert('todos', task.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<int> createUser(int isVerified) async {
    final db = await DBHelper.db();
    final data = {
      "id": 1,
      "isVerfied": isVerified,
    };

    final id = await db.insert('user', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await DBHelper.db();
    return db.query("user", orderBy: "id");
  }
}
