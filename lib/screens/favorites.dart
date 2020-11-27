import 'package:Meals/models/meal.dart';
import 'package:Meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoritesMeals;

  Favorites(this.favoritesMeals);
  @override
  Widget build(BuildContext context) {
    if(favoritesMeals.isEmpty){
       return Center(
      child: Text('You have no favorites yet - start adding some!'),
    );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeals[index].id,
            title: favoritesMeals[index].title,
            imageUrl: favoritesMeals[index].imageUrl,
            duration: favoritesMeals[index].duration,
            complexity: favoritesMeals[index].complexity,
            affordability: favoritesMeals[index].affordability,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
   
  }
}