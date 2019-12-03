import 'dart:async';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:starving/models/food.dart';
import 'package:starving/models/food_type.dart';
import 'package:starving/services/foods.dart';

class FoodBloc extends Bloc {
  final _foodController = StreamController<List<Food>>.broadcast();
  final _recomendationController =
      StreamController<Map<FoodType, Food>>.broadcast();

  final _foodService = FoodService();

  List<Food> _foods = [];


  get foods => _foodController.stream;

  get recomendations => _recomendationController.stream;

  dispose() {
    _foodController.close();
    _recomendationController.close();
  }

  addFood(Food food) async {
    await _foodService.insertFood(food);
    getFoods();
  }

  deleteFood(int id) async {
    await _foodService.deleteFood(id);
    getFoods();
  }

  getFoods() async {
    var dbFoods = await _foodService.getFoods();
    _foods = dbFoods;
    dbFoods.forEach((f) {
      print(f.toMap());
    });
    _foodController.sink.add(dbFoods);
  }

  getRecomendations() async {

    if(_foods.isEmpty) {
      await getFoods();
    }

    final primaries =
        _foods.where((f) => f.foodType == FoodType.Primary).toList();
    final secondaries =
        _foods.where((f) => f.foodType == FoodType.Secondary).toList();
    final optionals =
        _foods.where((f) => f.foodType == FoodType.Optional).toList();

    primaries.shuffle();
    secondaries.shuffle();
    optionals.shuffle();

    Map<FoodType, Food> recomendations = {
      FoodType.Primary: primaries.first,
      FoodType.Secondary: secondaries.first,
      FoodType.Optional: optionals.first
    };

    _recomendationController.sink.add(recomendations);
  }
}
