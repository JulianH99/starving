import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starving/models/food_type.dart';
import 'package:flutter/material.dart';

class Food extends Equatable {
  final String name;
  final FoodType foodType;
  final int id;

  Food({@required this.name, @required this.foodType, this.id = 0});

  @override
  get props => [foodType, name];

  static Food fromMap(Map<String, dynamic> map) {
    return Food(
        name: map['name'],
        foodType: FoodType.values[map['food_type']],
        id: map['id']);
  }

  Map<String, dynamic> toMap() => {"name": name, "food_type": foodType.index};

  Color getColorFromType() {
    switch (foodType) {
      case FoodType.Primary:
        return Colors.green[700];
      case FoodType.Secondary:
        return Colors.blue[700];
      case FoodType.Optional:
        return Colors.yellow[700];
    }
    return Colors.black;
  }
}
