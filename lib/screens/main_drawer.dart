import 'package:flutter/material.dart';
import 'package:meals_app/screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _menuItemBuilder(
      {IconData icon, String title, Function onTapHandler}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'My Meals App',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _menuItemBuilder(
              icon: Icons.restaurant,
              title: 'Meals',
              onTapHandler: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          _menuItemBuilder(
              icon: Icons.settings,
              title: 'Settings',
              onTapHandler: () {
                Navigator.of(context)
                    .pushReplacementNamed(SettingsScreen.routeName);
              }),
        ],
      ),
    );
  }
}
