import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../screens/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals'),),
          body: GridView(
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
      ),
    );
  }
}
