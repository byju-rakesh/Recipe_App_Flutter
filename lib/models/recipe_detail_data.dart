class RecipeDetailsData {
  final int id;
  final String image;
  final String title;
  final int aggregateLikes;
  final int healthScore;
  final double? spoonacularScore;
  final double? pricePerServing;

  RecipeDetailsData({
    required this.id,
    required this.image,
    required this.title,
    required this.aggregateLikes,
    required this.healthScore,
    required this.spoonacularScore,
    required this.pricePerServing,
  });

  factory RecipeDetailsData.fromJson(dynamic recipeDetailsData) {
    return RecipeDetailsData(
        id: recipeDetailsData['id'],
        image: recipeDetailsData['image'],
        title: recipeDetailsData['title'],
        aggregateLikes: recipeDetailsData['aggregateLikes'],
        healthScore: (recipeDetailsData['healthScore']),
        spoonacularScore: (recipeDetailsData['spoonacularScore']),
        pricePerServing: (recipeDetailsData['pricePerServing']));
  }
}
