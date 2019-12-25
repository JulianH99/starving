enum FoodType { Primary, Secondary, Optional }

String getTextFromType(foodType) {
  switch (foodType) {
    case FoodType.Primary:
      return "Principal";
    case FoodType.Secondary:
      return "Secundaria";
    case FoodType.Optional:
      return "Opcional";
  }
  return "";
}
