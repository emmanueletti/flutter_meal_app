import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen(saveFilters, {Key key}) : super(key: key);

  static const routeName = '/filters-screen';

  Function saveFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  Widget _buildSwitchListTile(
      {@required String title,
      @required bool currentValue,
      String subtitle,
      @required void Function(bool) updateValue}) {
    // Flutter widget that allows for a switch next to a text
    // Widget will also handle the logic of checking previous state
    // and new state
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(onPressed: widget.saveFilters, icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    title: 'Gluten Free',
                    currentValue: _glutenFree,
                    updateValue: (newValue) {
                      setState(() => _glutenFree = newValue);
                    },
                    subtitle: 'Will only show gluten free meals'),
                _buildSwitchListTile(
                    title: 'Lactose Free',
                    currentValue: _lactoseFree,
                    updateValue: (newValue) {
                      setState(() => _lactoseFree = newValue);
                    },
                    subtitle: 'Will only show lactose free meals'),
                _buildSwitchListTile(
                    title: 'Vegan',
                    currentValue: _vegan,
                    updateValue: (newValue) {
                      setState(() => _vegan = newValue);
                    },
                    subtitle: 'Will only show vegan meals'),
                _buildSwitchListTile(
                    title: 'Vegetarian',
                    currentValue: _vegetarian,
                    updateValue: (newValue) {
                      setState(() => _vegetarian = newValue);
                    },
                    subtitle: 'Will only show vegetarian meals'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
