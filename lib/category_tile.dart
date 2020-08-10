import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String _title;
  final Color _bgColor;
  final String _id;

  CategoryTile(this._id, this._title, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: this._bgColor),
      child: Text(this._title),
    );
  }
}
