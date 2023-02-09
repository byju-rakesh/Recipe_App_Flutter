import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/models/recipe_detail_data.dart';

class RecipeDetailsCard extends StatelessWidget {
  final RecipeDetailsData recipeDetailsData;
  RecipeDetailsCard(this.recipeDetailsData);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Card(
            elevation: 1,
            child: Image.network(recipeDetailsData.image),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.5,
          margin: EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'id : ${recipeDetailsData.id}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'title : ${recipeDetailsData.title}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'aggregatesLikes : ${recipeDetailsData.aggregateLikes}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'healthScore : ${recipeDetailsData.healthScore}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'spoonacularScore : ${recipeDetailsData.spoonacularScore}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'pricePerServing : ${recipeDetailsData.pricePerServing}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
