import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/widgets/recipe_detail_card.dart';
import '../models/recipe_detail_data.dart';
import './networks/recipe_api_service.dart';

class RecipeDetail extends StatefulWidget {
  final int id;
  RecipeDetail(this.id);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late Future<RecipeDetailsData> recipeDetailsById;

  @override
  void initState() {
    super.initState();
    recipeDetailsById = RecipeApiService().getRecipeDetailsById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Detail'),
      ),
      body: FutureBuilder(
        future: recipeDetailsById,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RecipeDetailsCard(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
