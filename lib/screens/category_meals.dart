import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = 'category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMeals({this.categoryId, this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    //how to get data from named routes without the constructor.
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    //return a list of meals that contains the specified categories
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
