import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Center(child: Text('hello'),);
        },
        itemCount: 1,
      ),
    );
  }
}
