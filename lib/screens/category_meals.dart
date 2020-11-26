import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes meals'),
      ),
      body: Center(
        child: Text('Meals'),
      ),
    );
  }
}
