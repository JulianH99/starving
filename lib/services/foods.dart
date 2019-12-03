import 'package:sqflite/sqlite_api.dart';
import 'package:starving/models/food.dart';
import 'package:starving/services/db.dart';

class FoodService {
  Database _db;

  FoodService() {
    getDb();
  }

  Future<void> getDb() async {
    if (_db == null) {
      _db = await DB.getDb();
    }
  }

  Future<List<Food>> getFoods() async {
    await this.getDb();
    var foods = await _db.query(DB.tableName);
    print("Getting foods from db");
    print(foods);
    return foods.map((food) => Food.fromMap(food)).toList();
  }

  Future<dynamic> insertFood(Food food) async {
    return await _db.insert(DB.tableName, food.toMap());
  }

  Future<dynamic> deleteFood(int id) async {
    return await _db.delete(DB.tableName, where: "id = ?", whereArgs: [id]);
  }
}
