class RecipeData {
  final int calories;
  final String carbs;
  final String fat;
  final int id;
  final String image;
  final String protein;
  final String title;
  bool isBookMarked = false;

  RecipeData({
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.id,
    required this.image,
    required this.protein,
    required this.title,
  });

  factory RecipeData.fromJson(dynamic recipeData) {
    return RecipeData(
      calories: recipeData['calories'],
      carbs: recipeData['carbs'],
      fat: recipeData['fat'],
      id: recipeData['id'],
      image: recipeData['image'],
      protein: recipeData['protein'],
      title: recipeData['title'],
    );
  }
  static List<RecipeData> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return RecipeData.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'RecipeData {calories:$calories, carbs:$carbs, fat:$fat, id:$id,image:$image,protein:$protein,title:$title}';
  }
}
