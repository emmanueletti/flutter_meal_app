import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key key}) : super(key: key);

  static const routeName = '/meal-detail-screen';

  @override
  Widget build(BuildContext context) {
    // Arguments are pulled out in the build method - that is where context
    // can be accessed
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: Center(
        child: Text('the meal - ${routeArgs['mealId']}'),
      ),
    );
  }
}
