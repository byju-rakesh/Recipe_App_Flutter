import 'package:floor/floor.dart';

@entity
class RecipeDbData {
  @primaryKey
  final int id;
  final int calories;
  final String carbs;
  final String fat;
  final String image;
  final String protein;
  final String title;

  RecipeDbData({
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.id,
    required this.image,
    required this.protein,
    required this.title,
  });

  RecipeDbData.fromMap(Map<String, dynamic> recipeDbData)
      : id = recipeDbData['id'],
        title = recipeDbData['title'],
        calories = recipeDbData['calories'],
        carbs = recipeDbData['carbs'],
        fat = recipeDbData['fat'],
        image = recipeDbData['image'],
        protein = recipeDbData['protein'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'calories': calories,
      'carbs': carbs,
      'fat': fat,
      'image': image,
      'protein': protein
    };
  }
}
