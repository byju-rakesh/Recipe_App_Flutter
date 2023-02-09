import 'package:flutter/material.dart';
import 'dart:async';
import 'package:recipe_app_flutter/models/recipe_data.dart';
import 'package:recipe_app_flutter/widgets/Recipe_list.dart';
import './recipe_db_screen.dart';
import './networks/recipe_api_service.dart';
import '../recipe_db/recipe_database.dart';
import '../recipe_db/recipe_db_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // final RecipeData recipeData = RecipeData(
  //     calories: 10,
  //     carbs: 'carbs',
  //     fat: 'fat',
  //     id: 1,
  //     image: 'image',
  //     //isBookMarked: false,
  //     protein: 'protein',
  //     title: 'title');
  late Future<List<RecipeData>> recipeLists;
  late RecipeDatabase database;
  late List<RecipeDbData> dblist = [];

  @override
  void initState() {
    super.initState();
    recipeLists = RecipeApiService().getRecipeLists();
    $FloorRecipeDatabase
        .databaseBuilder('recipe_database.db')
        .build()
        .then((value) async {
      database = value;
      await getAllRecipesList();
      setState(() {});
    });
  }

  Future<List<RecipeDbData>> getAllRecipesList() async {
    dblist = await database.recipeDao.getAllRecipes();
    return dblist;
  }

  void showBookMark() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDbScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recipe App'),
        ),
        body: FutureBuilder(
          future: recipeLists,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (var element in snapshot.data!) {
                for (var eldb in dblist) {
                  if (eldb.id == element.id) {
                    element.isBookMarked = true;
                  }
                }
              }
              return RecipeList(
                recipeLists: snapshot.data!,
                database: database,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        bottomNavigationBar: TextButton(
          child: Text(
            'ShowBookMarkList',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onPressed: showBookMark,
        ),
      ),
    );
  }
}
