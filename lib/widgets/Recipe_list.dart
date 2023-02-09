import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/recipe_db/recipe_database.dart';
import 'package:recipe_app_flutter/widgets/recipe_card.dart';

import '../models/recipe_data.dart';

class RecipeList extends StatelessWidget {
  final List<RecipeData> recipeLists;
  final RecipeDatabase database;
  RecipeList({required this.recipeLists, required this.database});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (contex, index) {
        return RecipeCard(
          recipeData: recipeLists[index],
          isCollapseShowing: false,
          recipeLists: recipeLists,
          database: database,
        );
      },
      itemCount: recipeLists.length,
    );
  }
}
