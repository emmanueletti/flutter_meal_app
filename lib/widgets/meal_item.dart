import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {Key key,
      @required this.id,
      @required this.imageUrl,
      @required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.removeItem})
      : super(key: key);

  final affordability;
  final complexity;
  final String id;
  final int duration;
  final String imageUrl;
  final String title;
  final removeItem;

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailScreen.routeName,
      arguments: {'mealId': id},
      // Any result passed to a pop can be access here when the user pops back
      // to the page that initially pushed
    ).then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // ClipRRect allows us to clip / shape the child to match the
                // the contrainsts given to ClipRRect. In this case the borderradius
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    // BoxFit cover tells flutter to both crop and resize the
                    // image to fit
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                // Positioned is a widget that can be used in stack
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordabilityText'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
