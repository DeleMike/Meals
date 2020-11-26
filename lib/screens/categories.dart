import 'package:Meals/models/category.dart';
import 'package:flutter/material.dart';

import 'package:Meals/dummy_data.dart';
import 'package:Meals/screens/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES.map((categoryData) {
        return CategoryItem(
          title: categoryData.title,
          color: categoryData.color,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
