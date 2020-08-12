import 'package:flutter/material.dart';
import 'package:meals_app/widgets/dummy_data.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailScreen({this.toggleFavorite, this.isFavorite});

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        height: 150,
        width: 250,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
        actions: [
          IconButton(
            icon: Icon(
                isFavorite(meal.id) ? Icons.favorite : Icons.favorite_border),
            onPressed: () => toggleFavorite(meal.id),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 280,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            _buildSectionTitle('Meal ingredients', context),
            _buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      child: Text(
                        meal.ingredients.elementAt(index),
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            _buildSectionTitle('Steps to make', context),
            _buildContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(
                        meal.steps.elementAt(index),
                      ),
                    ),
                    Divider(
                      height: 0.5,
                      color: Theme.of(context).accentColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
