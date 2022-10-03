import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_menu/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoriesMealScreen({super.key});

  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String mealID) {}
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoriesMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoriesMeals[index].id,
              title: categoriesMeals[index].title,
              imageUrl: categoriesMeals[index].imageUrl,
              duration: categoriesMeals[index].duration,
              affordability: categoriesMeals[index].affordability,
              complexity: categoriesMeals[index].complexity,
            );
          },
          itemCount: categoriesMeals.length,
        ));
  }
}
