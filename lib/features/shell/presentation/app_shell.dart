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
      FuelPage(), // 0
      MapPage(),  // 1
      Center(child: Text('Profile (stub)')), // 2
    ];

    return Scaffold(
      // ✅ AppBar тут
      appBar: AppBar(
        title: const Text('GTTS'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),

      drawer: const AppDrawer(), // ✅ бокове меню
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => ref.read(tabIndexProvider.notifier).state = i,
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
