import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../vehicle/presentation/vehicle_page.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('GTTS', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),

            ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text('Автомобіль'),
              onTap: () async {
                // 1) закриваємо Drawer
                Navigator.pop(context);

                // 2) відкриваємо VehiclePage як окремий екран
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Scaffold(
                      body: SafeArea(child: VehiclePage()),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
