import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_tile.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  // final String _categoryTitle;
  // final String _categoryId;
  // CategoryMealsScreen(this._categoryId, this._categoryTitle);

  static const routeName = '/meal-category';

  CategoryMealsScreen({this.availableMeals});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'];
    final String categoryId = routeArgs['id'];
    final categoryMeals = availableMeals
        .where((element) => element.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealTile(
            id: categoryMeals.elementAt(index).id,
            title: categoryMeals.elementAt(index).title,
            imgUrl: categoryMeals.elementAt(index).imageUrl,
            affordability: categoryMeals.elementAt(index).affordability,
            complexity: categoryMeals.elementAt(index).complexity,
            duration: categoryMeals.elementAt(index).duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
