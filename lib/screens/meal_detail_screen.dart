import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key key}) : super(key: key);

  static const routeName = '/meal-detail-screen';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer({@required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      // Ideally these heights and widgets would be responsive
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Arguments are pulled out in the build method - that is where context
    // can be accessed
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == routeArgs['mealId']);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      // can wrap scaffold body content with singlechildscrollview to make screen
      // scrollable. Can do this b.c body of a scaffold has a defined height
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
