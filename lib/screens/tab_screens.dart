import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';

import './categories.dart';
import './favorites.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoritesMeal;
  TabScreen(this.favoritesMeal);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _tabs;

  @override
  initState(){
    _tabs = [
    {
      'tab': Categories(),
      'title': 'Categories',
    },
    {
      'tab': Favorites(widget.favoritesMeal),
      'title': 'Your Favorites',
    },
  ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_selectedPageIndex]['title']),
      ),
      body: _tabs[_selectedPageIndex]['tab'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites'),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
