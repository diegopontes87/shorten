import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shortly/shared/res/app_strings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BaseDBProvider {
  BaseDBProvider();

  BaseDBProvider._();
  static final BaseDBProvider db = BaseDBProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE ${AppStrings.tableName} ("
            "id INTEGER PRIMARY KEY,"
            "code TEXT,"
            "short_link TEXT,"
            "original_link TEXT"
            ")");
      },
    );
  }
}
