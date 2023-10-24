import 'package:flutter/material.dart';
import 'package:meal_apps/data/dummy_data.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.bottomRight,
                end: Alignment.topCenter,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.account_circle_rounded),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  'Drawer',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.access_time_filled_sharp,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(color: Colors.deepOrange),
            ),
            onTap: () {
              onSelectScreen('Meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.access_time_filled_sharp,
            ),
            title: const Text(
              'Filters',
              style: TextStyle(color: Colors.deepOrange),
            ),
            onTap: () {
              onSelectScreen('Filters');},
          ),
        ],
      ),
    );
  }
}
