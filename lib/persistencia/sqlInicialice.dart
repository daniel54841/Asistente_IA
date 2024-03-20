import 'package:sqflite/sqflite.dart';

import '../controllers/models/compra.dart';

class SqlInicialice {
  static Database? _database;

  static Future<void> createDB() async {
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/miBD.db";
    // open the database
    _database = await openDatabase(path, version: 1);
  }

  static Future<void> closeDB() async {
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/miBD.db";
    // Close the database
    await _database!.close();
  }

  static Future<void> insert(Compra compra) async {
    /* compra = await _database?.insert("miBD.db", compra.toMap());*/
  }
}
