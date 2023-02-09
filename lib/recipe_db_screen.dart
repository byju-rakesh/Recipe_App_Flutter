import 'package:flutter/material.dart';
import './recipe_db/recipe_db_data.dart';
import './recipe_db/recipe_database.dart';

class RecipeDbScreen extends StatefulWidget {
  @override
  State<RecipeDbScreen> createState() => _RecipeDbScreenState();
}

class _RecipeDbScreenState extends State<RecipeDbScreen> {
  late RecipeDatabase database;
  @override
  void initState() {
    super.initState();
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
    return await database.recipeDao.getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookMarkList'),
      ),
      body: FutureBuilder(
          future: getAllRecipesList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text('title : ${snapshot.data![index].title}'),
                    subtitle: Text('id : ${snapshot.data![index].id}'),
                  ));
                },
              );
            } else {
              return Text('${snapshot.error}');
            }
          }),
    );
    ;
  }
}
