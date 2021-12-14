import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters-screen';
  const FiltersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
    );
  }
}
