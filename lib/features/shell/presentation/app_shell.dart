import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/tab_provider.dart';
import 'app_drawer.dart';

import '../../fuel/presentation/fuel_page.dart';
import '../../map/presentation/map_page.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabIndexProvider);

    final pages = const [
      FuelPage(), // index 0
      MapPage(),  // index 1
      Center(child: Text('Profile (stub)')), // index 2
    ];

    return Scaffold(
      drawer: const AppDrawer(), // ← БОКОВЕ МЕНЮ
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) =>
            ref.read(tabIndexProvider.notifier).state = index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station),
            label: 'Заправка',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Навігатор',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профіль',
          ),
        ],
      ),
    );
  }
}
