import 'package:flutter/material.dart';
import 'package:meals_app/screens/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;

  Widget _buildFilter(
      String title, String subtitle, bool val, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(subtitle),
      value: val,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildFilter('Gluten-free', 'Show only gluten-free meals.',
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                _buildFilter('Lactose-free', 'Show only lactose-free meals.',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                _buildFilter('Vegan', 'Show only vegan meals.', _isVegan,
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                _buildFilter(
                    'Vegetarian', 'Show only vegetarian meals.', _isVegetarian,
                    (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
