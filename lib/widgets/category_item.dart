import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.id, this.title, this.color, {Key key})
      : super(key: key);

  final Color color;
  final String id;
  final String title;

  void selectCategory(BuildContext context) {
    // Remember context object contains a lot of metadata about the relationships
    // between the widget. And thus important for a built in widget like
    // Navigator. Think of context like your element tree

    // Method 1 of routing: using unamed routes
    Navigator.of(context).pushNamed(
      CategoriesMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    // Inkwell = Gesture detecture that also has a Material-like ripple effect
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
