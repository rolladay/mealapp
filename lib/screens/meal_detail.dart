import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';
import 'package:meal_apps/providers/favorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  final TextStyle textStyle =
      const TextStyle(fontSize: 16.0, color: Colors.white);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavoriteMealStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded ? 'Deleted' : 'KKK'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(meal.imageUrl),
              width: double.infinity,
              fit: BoxFit.cover,
              height: 200,
            ),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              'Ingridients',
              style: textStyle.copyWith(color: Colors.red),
            ),
            const SizedBox(
              height: 10.0,
            ),
            for (final ingridient in meal.ingredients)
              Text(
                ingridient,
                style: textStyle,
              ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Steps',
              style: textStyle.copyWith(color: Colors.red),
            ),
            const SizedBox(
              height: 10.0,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  step,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
