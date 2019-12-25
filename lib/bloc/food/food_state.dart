import 'package:equatable/equatable.dart';
import 'package:starving/models/food.dart';
import 'package:starving/models/food_type.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class InitialFoodState extends FoodState {}

class FoodLoading extends FoodState {}

class FoodItemsLoaded extends FoodState {
  final List<Food> foods;

  FoodItemsLoaded(this.foods);

  @override
  get props => [foods];
}

class FoodAdded extends FoodState {}

class FoodGenerated extends FoodState {
  final Map<FoodType, Food> recomendations;

  FoodGenerated(this.recomendations);

  @override
  get props => [recomendations];
}
