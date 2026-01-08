import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/vehicle_provider.dart';
import 'vehicle_binding_page.dart';

class VehiclePage extends ConsumerWidget {
  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(vehicleProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Автомобіль',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: vehicle == null
                ? const Text('Автомобіль не прив’язаний. Натисни Bind.')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Plate: ${vehicle.plate}', style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 6),
                      Text('Country: ${vehicle.country}'),
                    ],
                  ),
          ),
        ),

        const SizedBox(height: 12),

        ElevatedButton.icon(
          icon: const Icon(Icons.link),
          label: Text(vehicle == null ? 'BIND VEHICLE' : 'CHANGE VEHICLE'),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const VehicleBindingPage()),
            );
          },
        ),

        const SizedBox(height: 12),

        OutlinedButton.icon(
          icon: const Icon(Icons.link_off),
          label: const Text('UNBIND (MVP)'),
          onPressed: () {
            ref.read(vehicleProvider.notifier).state = null;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Vehicle unbound')),
            );
          },
        ),
      ],
    );
  }
}
