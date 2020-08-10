import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String _categoryTitle;
  // final String _categoryId;

  // CategoryMealsScreen(this._categoryId, this._categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: Container(
        child: Text(
          'Container',
        ),
      ),
    );
  }
}
