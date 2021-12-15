import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoriesMealsScreen extends StatefulWidget {
  CategoriesMealsScreen(availableMeals, {Key key}) : super(key: key);

  List<Meal> availableMeals;
  static const routeName = '/category-meals-screen';

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryId;
  List<Meal> displayedMeals;
  String title;

  var _loadedInitData = false;

  // Lesson 178 of Flutter course
  @override
  void didChangeDependencies() {
    // Cant do this inside initState, bc even though context object is globally
    // available instead the widget, initState runs before the widget is fully
    // created and thus before the context object exists.
    // Did change dependencies runs everytime the widgets dependencies change
    // and importantly
    // - runs AFTER initstate
    // - runs AFTER widget is fully created and thus context object exists
    // - but runs BEFORE build method is called.
    // But since it runs everytime dependencies of the state changes we need a flag to make
    // sure the initializing logic only runs once.
    if (!_loadedInitData) {
      super.didChangeDependencies();
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
    }
    _loadedInitData = true;
  }

  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: displayedMeals[index].id,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
