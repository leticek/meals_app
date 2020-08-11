import 'package:flutter/material.dart';

import '../widgets/category_tile.dart';
import '../widgets/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: [
          ...DUMMY_CATEGORIES
              .map((cat) => CategoryTile(cat.id, cat.title, cat.color))
              .toList()
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.height * 0.4,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
      ),
    );
  }
}
