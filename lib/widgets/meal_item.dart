import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_menu/view/meal_detailsScreen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  final Function? removeItem;

  const MealItem({
    super.key,
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
    this.removeItem,
  });

  String? get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'unkown';
    }
  }

  String? get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Challenging';

      case Affordability.Luxurious:
        return 'Expensive';

      default:
        return 'unkown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDeatilScreen.routeName, arguments: id)
        .then((result) => {
              if (result != null) {removeItem!(result)}
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
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.asset(
                      imageUrl!,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: Text(
                        title!,
                        style:
                            const TextStyle(fontSize: 26, color: Colors.white),
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
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(complexityText!)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText!)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
