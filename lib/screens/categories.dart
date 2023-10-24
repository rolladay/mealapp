import 'package:flutter/material.dart';
import 'package:meal_apps/data/dummy_data.dart';
import 'package:meal_apps/widgets/category_grid_item.dart';
import 'package:meal_apps/models/category.dart';

import '../models/meal.dart';
import 'meals.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.availableMeal});

  final List<Meal> availableMeal;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  // 이 위젯이 사라지면 무조건 이 애니메이션 컨트롤러 메모리에서 날려라~

  void categorySelect(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeal
        .where((item) => item.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          meals: filteredMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            //avvailableCategories.map((item)=> CategoryGridItem(category : item)).toList()
            for (Category category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    categorySelect(context, category);
                  }),
          ],
        ),
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut),
            ),
            child: child,
          );
        });
  }
}
