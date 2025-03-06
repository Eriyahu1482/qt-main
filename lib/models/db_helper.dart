import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qt/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
    static final DbHelper _instance = DbHelper._internal();

  factory DbHelper() => _instance;

  static Database? _database;

  DbHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "your_database_name.db");
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<int> insertUser(UserModel user) async {
    Database? db = await database;
    return await db!.insert('users', user.toMap());
  }

  Future<bool> isUserAuthenticated(String email, String password) async {
    Database? db = await database;
    List<Map<String, dynamic>> result = await db!.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }
}
