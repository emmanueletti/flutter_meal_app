import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

// Not the best to manage state in the topmost level. Whenever that state
// changes, the build method of the top level widget gets called meaning, entire
// app gets rebuilt. Even though Flutter has alot of optimizations, this is still
// not performant
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() => _filters = {...filterData});

    List<Meal> _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['glutenFree'] && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactoseFree'] && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // Argument that tells Flutter what the entry point / root screen of the
      // app is
      home: TabsScreen(),
      routes: {
        CategoriesMealsScreen.routeName: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters),
      },
      // onGenerateRoute gets hit when navigator.pushNamed is called for a route
      // that has not yet been registed in the main routes object. It ultimately
      // returns a route as an error fallback. Gives access to the settings
      // object which has information about the route data like "name", "arguments",etc.
      // This can be used to set up conditional logic to ultimately return whatever
      // route we want. Useful for situations where the route name may not be known
      // in advanced and is dynamically generated during run time.
      onGenerateRoute: (settings) {
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/somthing-else') {
        //   return ...;
        // } else if (settings.arguments == 'something-something-else') {
        //   return ...;
        // }
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      // onUnknownRoute is the ultimate fallback for a route that doesn't exist or
      // isn't registed in the routes object. Think of it like a 404 page. Without
      // this the page just crashes
      onUnknownRoute: (settings) {
        // Need to return a built materialpageroute
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
