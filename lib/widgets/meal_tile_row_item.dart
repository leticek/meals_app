import 'package:flutter/material.dart';

class MealTileRowItem extends StatelessWidget {
  const MealTileRowItem({
    @required this.textLabel,
    @required this.icon,
  });

  final String textLabel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 6),
        Text(textLabel),
      ],
    );
  }
}
