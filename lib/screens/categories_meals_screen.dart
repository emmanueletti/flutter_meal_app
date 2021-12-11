import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
// import '../models/meal.dart';
import '../dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({Key key}) : super(key: key);

  static const routeName = '/category-meals-screen';

  @override
  Widget build(BuildContext context) {
    // ModalRoute gives access to information about the page that routed user
    // to this screen. access inside the build method b/c context object is needed
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final mealsInCategory = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: mealsInCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: mealsInCategory[index].id,
            imageUrl: mealsInCategory[index].imageUrl,
            title: mealsInCategory[index].title,
            duration: mealsInCategory[index].duration,
            complexity: mealsInCategory[index].complexity,
            affordability: mealsInCategory[index].affordability,
          );
        },
      ),
    );
  }
}
