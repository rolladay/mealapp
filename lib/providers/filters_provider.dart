import 'package:flutter/foundation.dart';
import 'package:meal_apps/providers/meals_provider.dart';
import 'package:riverpod/riverpod.dart';
import '../screens/filters.dart';

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoFree: false,
          Filter.vegiterian: false,
          Filter.began: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter : isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) => FilterNotifier(),);


final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where(
        (item) {
      if (activeFilters[Filter.glutenFree]! && !item.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoFree]! && !item.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegiterian]! && !item.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.began]! && !item.isVegan) {
        return false;
      }
      return true;
    },
  ).toList();
});