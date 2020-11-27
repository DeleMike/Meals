import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorites;
  final Function isFavorite;

  MealDetail(this.toggleFavorites, this.isFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child, MediaQueryData mediaQuery) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: mediaQuery.size.height * 0.3,
      width: mediaQuery.size.width * 0.9,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
        (meal) => meal.id == mealId); //get selected meal based on ID
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    selectedMeal.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                background: Container(
                  height: mediaQuery.size.height * 0.3,
                  width: double.infinity,
                  child:
                      Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildSectionTitle('Ingredients', context),
              buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Card(
                        color: Theme.of(context).accentColor.withOpacity(0.7),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            selectedMeal.ingredients[index],
                          ),
                        ),
                      );
                    },
                    itemCount: selectedMeal.ingredients.length,
                  ),
                  mediaQuery),
              buildSectionTitle('Steps', context),
              buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    ),
                    itemCount: selectedMeal.steps.length,
                  ),
                  mediaQuery),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFavorites(mealId);
        }
            
      ),
    );
  }
}
