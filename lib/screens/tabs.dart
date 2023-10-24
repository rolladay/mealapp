import 'package:flutter/material.dart';
import 'package:meal_apps/models/meal.dart';
import 'package:meal_apps/providers/filters_provider.dart';
import 'package:meal_apps/screens/categories.dart';
import 'package:meal_apps/screens/meals.dart';
import 'package:meal_apps/widgets/main_drawer.dart';
import '../providers/meals_provider.dart';
import 'filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_apps/providers/favorites_provider.dart';

Map<Filter, bool> kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoFree: false,
  Filter.vegiterian: false,
  Filter.began: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  Map<Filter, bool> selectedFilter = kInitialFilter;

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }

  int _selectedPageIndex = 0;
  String activePageTitle = 'Categories';
  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final activeFilters = ref.watch(filtersProvider);
    //mealProvider가 바뀔때 언제든 보는 리스너를 설치한거임.
    final availableCMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoryScreen(
      availableMeal: availableCMeals,
    );
    activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favoriteMeals2 = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals2,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
