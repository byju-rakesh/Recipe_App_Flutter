import 'dart:async';
import 'package:floor/floor.dart';
import 'recipe_db_data.dart';
import 'recipe_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'recipe_database.g.dart';

@Database(version: 1, entities: [RecipeDbData])
abstract class RecipeDatabase extends FloorDatabase {
  RecipeDao get recipeDao;
}
