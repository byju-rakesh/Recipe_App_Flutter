import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:recipe_app_flutter/models/recipe_detail_data.dart';
import '../utils/constants.dart';
import '../models/recipe_data.dart';

class RecipeApiService {
  Future<List<RecipeData>> getRecipeLists() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.findByNutrients);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<RecipeData> recipeLists =
            RecipeData.recipesFromSnapshot(jsonDecode(response.body));
        return recipeLists;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to load RecipeList');
  }

  Future<RecipeDetailsData> getRecipeDetailsById(int id) async {
    final String recipeDetailsfindById =
        'recipes/$id/information?apiKey=69ddad241e4b4d49a95a8b4bb75a8d87&includeNutrition=false';

    try {
      var url = Uri.parse(ApiConstants.baseUrl + recipeDetailsfindById);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        RecipeDetailsData recipeDetailsById =
            RecipeDetailsData.fromJson(jsonDecode(response.body));
        return recipeDetailsById;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to load RecipeDetailsById');
  }
}
