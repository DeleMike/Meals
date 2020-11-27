import 'package:Meals/dummy_data.dart';
import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';

import './screens/categories.dart';
import './screens/category_meals.dart';
import './screens/meal_detail.dart';
import './screens/tab_screens.dart';
import './screens/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
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

  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;
        _availableMeals = DUMMY_MEALS.where(
          (meal) {
            if (_filters['gluten'] && !meal.isGlutenFree) {
              return false;
            }

            if (_filters['lactose'] && !meal.isLactoseFree) {
              return false;
            }

            if (_filters['vegan'] && !meal.isVegan) {
              return true;
            }

            if (_filters['vegetarian'] && !meal.isVegetarian) {
              return false;
            }
            return true;
          },
        ).toList();
      },
    );
  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      _favoriteMeals.add(
        DUMMY_MEALS.firstWhere(
          (meal) => meal.id == mealId,
        ),
      );
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(_favoriteMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetail.routeName: (ctx) =>
            MealDetail(_toggleFavorites, _isMealFavorite),
        Filters.routeName: (ctx) => Filters(
              _setFilters,
              _filters,
            ),
      },

      //if you going to an unregistered route this route will be shown in place of it
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => Categories());
      // },

      //if you going to an unregistered route or fluter fails to build a the widgets
      //this route will be shown in place of onGenerateRoute,
      // it if is not defined; so this can be used as 404 page
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
    );
  }
}
