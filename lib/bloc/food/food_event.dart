import 'package:equatable/equatable.dart';
import 'package:starving/models/food.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent() : super();

  @override
  List<Object> get props => [];
}

class AddFood extends FoodEvent {
  final Food food;

  AddFood(this.food);

  @override
  List<Object> get props => [food];
}

class GetFoods extends FoodEvent {}

class DeleteFood extends FoodEvent {
  final int id;

  DeleteFood(this.id);

  @override
  get props => [id];
}

class GenerateFood extends FoodEvent {}
