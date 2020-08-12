import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite.dart';
import 'package:meals_app/screens/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({this.favoriteMeals});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _screens = [];
  @override
  void initState() {
    _screens = [
      {
        'screen': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavoritesScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorite',
      },
    ];

    super.initState();
  }

  int _selectedIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            title: Text(
              'Categories',
            ),
            icon: Icon(Icons.fastfood),
          ),
          BottomNavigationBarItem(
            title: Text(
              'Favorite',
            ),
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
