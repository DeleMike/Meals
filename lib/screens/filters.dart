import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.saveFilters, this.currentFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool currentVal, Function updateListener) {
    return SwitchListTile(
        title: Text(title),
        value: currentVal,
        subtitle: Text(subtitle),
        onChanged: updateListener);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(_filters);
              },),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('Gluten Free',
                    'Only include gluten free meals', _glutenFree, (newVal) {
                  setState(() => _glutenFree = newVal);
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarians meals', _vegetarian,
                    (newVal) {
                  setState(() => _vegetarian = newVal);
                }),
                buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                    (newVal) {
                  setState(() => _vegan = newVal);
                }),
                buildSwitchListTile(
                    'Lactose Free', 'Only lactose free items', _lactoseFree,
                    (newVal) {
                  setState(() => _lactoseFree = newVal);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
