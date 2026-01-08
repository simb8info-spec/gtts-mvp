import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/tab_provider.dart';

import '../../vehicle/presentation/vehicle_page.dart';
import '../../tolls/presentation/tolls_page.dart';
import '../../hotels/presentation/hotels_page.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  Future<void> _goToTab(BuildContext context, WidgetRef ref, int tabIndex) async {
    Navigator.pop(context); // close drawer
    ref.read(tabIndexProvider.notifier).state = tabIndex;
  }

  Future<void> _openPage(BuildContext context, WidgetRef ref, Widget page) async {
    Navigator.pop(context); // close drawer
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('GTTS')),
        body: page,
      )),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GTTS', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Global Truck Toll & Services'),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text('Автомобіль'),
              onTap: () => _openPage(context, ref, const VehiclePage()),
            ),

            ListTile(
              leading: const Icon(Icons.navigation),
              title: const Text('Навігатор'),
              onTap: () => _goToTab(context, ref, 1), // Map tab
            ),

            ListTile(
              leading: const Icon(Icons.toll),
              title: const Text('Оплата доріг'),
              onTap: () => _openPage(context, ref, const TollsPage()),
            ),

            ListTile(
              leading: const Icon(Icons.local_gas_station),
              title: const Text('Заправка'),
              onTap: () => _goToTab(context, ref, 0), // Fuel tab
            ),

            ListTile(
              leading: const Icon(Icons.hotel),
              title: const Text('Готелі'),
              onTap: () => _openPage(context, ref, const HotelsPage()),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Профіль / Налаштування'),
              onTap: () => _goToTab(context, ref, 2), // Profile tab
            ),
          ],
        ),
      ),
    );
  }
}
