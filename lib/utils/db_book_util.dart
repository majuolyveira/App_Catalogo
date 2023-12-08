import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbBookUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'books.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE books (id TEXT PRIMARY KEY, title TEXT, image TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbBookUtil.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbBookUtil.database();
    return db.query(table);
  }
}