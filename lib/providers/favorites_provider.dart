import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class MyFavoriteMealNotifier extends StateNotifier<List<Meal>> {
  MyFavoriteMealNotifier() : super([]);

  bool toggleFavoriteMealStatus(Meal meal) {
    final mealIsContained = state.contains(meal);
    if (mealIsContained) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<MyFavoriteMealNotifier, List<Meal>>((ref) {
  return MyFavoriteMealNotifier();
});
