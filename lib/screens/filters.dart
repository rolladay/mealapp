import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_apps/main.dart';
import 'package:meal_apps/screens/tabs.dart';
import 'package:meal_apps/widgets/main_drawer.dart';
import 'package:meal_apps/providers/filters_provider.dart';
import 'package:riverpod/riverpod.dart';

enum Filter {
  glutenFree,
  lactoFree,
  vegiterian,
  began,
}

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    //watch setup the listner which rebuild everytime states changed
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: const Text(
                'Gluten Free',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Only included gluten free meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Colors.orange,
              contentPadding: const EdgeInsets.fromLTRB(24, 0, 34, 0),
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactoFree]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoFree, isChecked);
              },
              title: const Text(
                'Lacto Free',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Only included Lacto free meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Colors.orange,
              contentPadding: const EdgeInsets.fromLTRB(24, 0, 34, 0),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegiterian]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegiterian, isChecked);
              },
              title: const Text(
                'vegiterians',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Only included vegiterian meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Colors.orange,
              contentPadding: const EdgeInsets.fromLTRB(24, 0, 34, 0),
            ),
            SwitchListTile(
              value: activeFilters[Filter.began]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.began, isChecked);
              },
              title: const Text(
                'Began Meals',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Only included Began meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: Colors.orange,
              contentPadding: const EdgeInsets.fromLTRB(24, 0, 34, 0),
            ),
          ],
        ));
  }
}
