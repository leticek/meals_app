import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String _title;
  final Color _bgColor;
  final String _id;

  CategoryTile(this._id, this._title, this._bgColor);

  void _switchToCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/meal-category', arguments: {
      'id': this._id,
      'title': this._title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this._switchToCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            this._bgColor.withOpacity(0.6),
            this._bgColor,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          this._title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
