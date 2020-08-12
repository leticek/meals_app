import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/dummy_data.dart';

import './screens/category_meals_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilter(Map<String, bool> filters) {
    setState(() {
      _filters = filters;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  void _toggleFavorite(String mealId) {
    final int existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(
              availableMeals: this._availableMeals,
            ),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        SettingsScreen.routeName: (_) =>
            SettingsScreen(saveFilter: _setFilter, filters: _filters),
      },
    );
  }
}
