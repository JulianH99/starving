import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Database _instance;

  static final String tableName = 'foods';
  static final _createTableStr = """
  create table foods(
    id integer primary key autoincrement,
    name varchar(50) not null,
    food_type integer not null
  );
  """;

  static Future<Database> getDb() async {
    if (_instance == null) {
      _instance = await openDatabase(
          join(await getDatabasesPath(), 'starving.db'),
          version: 2, onCreate: (Database database, int version) async {
        await database.execute(_createTableStr);
        await database.insert(tableName, {"name": "Arroz", "food_type": 0});
        await database.insert(tableName, {"name": "Pasta", "food_type": 1});
        await database.insert(tableName, {"name": "Frijoles", "food_type": 1});
        await database.insert(tableName, {"name": "Pollo", "food_type": 2});
        await database.insert(tableName, {"name": "Salchicha", "food_type": 2});
      });
    }

    return _instance;
  }

  static close() async {
    await _instance.close();
  }
}
