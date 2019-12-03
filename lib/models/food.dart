import 'package:meta/meta.dart';
import 'package:starving/models/food_type.dart';
import 'package:flutter/material.dart';

class Food {
  String name;
  FoodType foodType;
  int id;

  Food({@required this.name, @required this.foodType, this.id});

  Food.fromMap(Map<String, dynamic> map)  {
    name = map['name'];
    foodType = FoodType.values[map['food_type']];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "food_type": foodType
  };


  Color getColorFromType() {
    switch(foodType) {
      case FoodType.Primary:
        return Colors.green[700];
      case FoodType.Secondary:
        return Colors.blue[700];
      case FoodType.Optional:
        return Colors.yellow[700];
    }
    return Colors.black;
  }

  String getTextFromType() {
    switch(foodType) {
      case FoodType.Primary:
        return "Principal";
      case FoodType.Secondary:
        return "Secundaria";
      case FoodType.Optional:
        return "Opcional";
    }
    return "";
  }
}
