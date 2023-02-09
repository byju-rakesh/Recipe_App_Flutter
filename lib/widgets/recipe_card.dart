import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/recipe_detail_screen.dart';
import '../models/recipe_data.dart';
import '../recipe_db/recipe_database.dart';
import '../recipe_db/recipe_db_data.dart';

class RecipeCard extends StatefulWidget {
  final List<RecipeData> recipeLists;
  final RecipeData recipeData;
  final RecipeDatabase database;
  bool isCollapseShowing;

  RecipeCard(
      {required this.recipeData,
      required this.isCollapseShowing,
      required this.recipeLists,
      required this.database});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  void _isBookMarkedShowed() {
    var recipeDb = widget.database.recipeDao;
    var data = widget.recipeData;
    setState(() {
      //if isBookMark is true and that is present in the db then it delete on
      // tap on bookMark
      if (data.isBookMarked && recipeDb.findStudentById(data.id) != null) {
        recipeDb.deleteRecipe(data.id);
        data.isBookMarked = !data.isBookMarked;
        var snackBar = SnackBar(content: Text('Recipe item deleted from DB'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (!data.isBookMarked) {
        //if not true then must insert in db
        RecipeDbData recipe = RecipeDbData(
            calories: data.calories,
            carbs: data.carbs,
            fat: data.fat,
            id: data.id,
            image: data.image,
            protein: data.protein,
            title: data.title);
        recipeDb.insertRecipeDetail(recipe);
        data.isBookMarked = !data.isBookMarked;
        var snackBar = SnackBar(content: Text('Recipe item inserted in DB'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void _isCollapsed() {
    setState(() {
      widget.isCollapseShowing = !widget.isCollapseShowing;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetail(widget.recipeData.id),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: 100,
              margin: EdgeInsets.only(left: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              // margin: EdgeInsets.only(left: 5),
              child: Card(
                  elevation: 2, child: Image.network(widget.recipeData.image)),
            ),
            Container(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title : ${widget.recipeData.title}'),
                  Text('Calories : ${widget.recipeData.calories}'),
                  if (widget.isCollapseShowing)
                    Text('Carbs : ${widget.recipeData.carbs}'),
                  if (widget.isCollapseShowing)
                    Text('fat : ${widget.recipeData.fat}')
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: _isCollapsed,
                  icon: Icon(Icons.add),
                ),
                widget.recipeData.isBookMarked
                    ? IconButton(
                        onPressed: _isBookMarkedShowed,
                        icon: Icon(Icons.bookmark),
                      )
                    : IconButton(
                        onPressed: _isBookMarkedShowed,
                        icon: Icon(Icons.bookmark_border))
              ],
            )
          ],
        ),
      ),
    );
  }
}
