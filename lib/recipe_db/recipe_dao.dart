import 'dart:core';
import 'package:floor/floor.dart';
import '../recipe_db/recipe_db_data.dart';

@dao
abstract class RecipeDao {
  @insert
  Future<void> insertRecipeDetail(RecipeDbData recipeData);

  @Query('SELECT * FROM RecipeDbData')
  Future<List<RecipeDbData>> getAllRecipes();

  @Query('DELETE FROM RecipeDbData WHERE id=:id')
  Future<void> deleteRecipe(int id);

  @Query('SELECT * FROM RecipeDbData WHERE id = :id')
  Future<RecipeDbData?> findStudentById(int id);
}
