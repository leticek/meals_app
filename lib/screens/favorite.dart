import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_tile.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({this.favoriteMeals});
  @override
  Widget build(BuildContext context) {
    return this.favoriteMeals.isEmpty
        ? Center(
            child: Container(
              child: Text(
                'You have no favorites yet.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealTile(
                id: favoriteMeals.elementAt(index).id,
                title: favoriteMeals.elementAt(index).title,
                imgUrl: favoriteMeals.elementAt(index).imageUrl,
                affordability: favoriteMeals.elementAt(index).affordability,
                complexity: favoriteMeals.elementAt(index).complexity,
                duration: favoriteMeals.elementAt(index).duration,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
