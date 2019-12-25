import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:starving/models/food.dart';
import 'package:starving/models/food_type.dart';
import 'package:starving/services/foods.dart';

import './bloc.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodService _foodService;
  List<Food> _foods = [];

  @override
  FoodState get initialState => InitialFoodState();

  FoodBloc(this._foodService);

  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    if (event is GenerateFood) {
      yield FoodLoading();
      final recomendations = await _getRecomendations();

      yield FoodGenerated(recomendations);
    }

    if (event is GetFoods) {
      yield FoodLoading();
      await _getFoods();

      yield FoodItemsLoaded(_foods);
    }

    if (event is AddFood) {
      yield FoodLoading();

      await _foodService.insertFood(event.food);

      await _getFoods();

      yield FoodItemsLoaded(_foods);
    }

    if (event is DeleteFood) {
      yield FoodLoading();
      await _foodService.deleteFood(event.id);

      await _getFoods();

      yield FoodItemsLoaded(_foods);
    }
  }

  _getFoods() async {
    List<Food> foods = await _foodService.getFoods();
    _foods = foods;
  }

  _getRecomendations() async {
    if (_foods.isEmpty) {
      await _getFoods();
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

    return recomendations;
  }
}
