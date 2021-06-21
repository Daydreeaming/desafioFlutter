import 'package:desafioflutter/Storage/internal_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends InternalStorageAdapter {
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'favorite_database.db');

    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE Favorites(id INTEGER PRIMARY KEY, favorite BOOL)');
    }, version: 1);
  }

  @override
  Future<dynamic> isFavorite(int id) async {
    final Database db = await database;
    var response =
        await db.query('Favorites', where: 'id = ?', whereArgs: [id]);

    if (response.length == 0) {
      return false;
    } else {
      if (response[0]['favorite'] == 'true') {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Future<void> changeFavorite(int id, bool favorite) async {
    final Database db = await _database;

    var filmObject = {
      'id': id,
      'favorite': favorite.toString(),
    };

    if (favorite == true) {
      await db.insert('Favorites', filmObject,
          conflictAlgorithm: ConflictAlgorithm.replace);

      print(
          'Foi inserido filme ${filmObject['id']} como ${filmObject['favorite']} no banco de dados');
    } else {
      await db.delete('Favorites', where: 'id = ?', whereArgs: [id]);

      print('Foi deletado o filme ${filmObject['id']} do banco de dados');
    }
  }
}
