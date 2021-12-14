import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
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
