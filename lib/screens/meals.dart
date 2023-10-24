import 'package:flutter/material.dart';
import 'package:meal_apps/main.dart';
import 'package:meal_apps/data/dummy_data.dart';
import 'package:meal_apps/screens/meal_detail.dart';
import 'package:meal_apps/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,

  });

  final String? title;
  final List<Meal> meals;


  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MealDetailScreen(meal: meal,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return meals.isEmpty
          ? const Center(
              child: Text(
                'No Meals Available',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                return MealItem(
                  meal: meals[index],

                );
              });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: meals.isEmpty
          ? const Center(
              child: Text(
                'No Meals Available',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                return MealItem(
                  meal: meals[index],

                );
              }),
    );
  }
}
