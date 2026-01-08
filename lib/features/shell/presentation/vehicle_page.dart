import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../lib/features/shell/presentation/vehicle_page.dart';

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
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        /// -------- VEHICLE CARD --------
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: vehicle == null
                ? const Text(
                    'Автомобіль не привʼязаний.\nНатисніть "Bind vehicle", щоб додати.',
                    style: TextStyle(fontSize: 16),
                  )
                : _VehicleDetails(vehicle: vehicle),
          ),
        ),

        const SizedBox(height: 16),

        /// -------- ACTION BUTTONS --------
        ElevatedButton.icon(
          icon: const Icon(Icons.link),
          label: Text(vehicle == null ? 'BIND VEHICLE' : 'CHANGE VEHICLE'),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VehicleBindingPage(),
              ),
            );
          },
        ),

        const SizedBox(height: 10),

        OutlinedButton.icon(
          icon: const Icon(Icons.link_off),
          label: const Text('UNBIND VEHICLE'),
          onPressed: vehicle == null
              ? null
              : () {
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

/// ================================
/// Vehicle details widget
/// ================================
class _VehicleDetails extends StatelessWidget {
  final Vehicle vehicle;
  const _VehicleDetails({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _row('Country', vehicle.country),
        _row('Plate', vehicle.plate),
        const Divider(),

        _row('EU category', '${vehicle.euGroup} / ${vehicle.euSubcategory}'),
        _row('Fuel type', vehicle.fuelType),
        _row('Emission standard', vehicle.emissionStandard),
        _row('Has trailer', vehicle.hasTrailer ? 'Yes' : 'No'),

        _row(
          'Axles',
          vehicle.axles != null ? vehicle.axles.toString() : '—',
        ),
        _row(
          'GVW (kg)',
          vehicle.gvwKg != null ? vehicle.gvwKg.toString() : '—',
        ),

        const SizedBox(height: 12),
        const Divider(),

        _StatusRow(
          label: 'Binding status',
          value: 'Bound',
          color: Colors.green,
        ),
        const _StatusRow(
          label: 'Credit eligibility',
          value: 'TBD',
          color: Colors.orange,
        ),
        const _StatusRow(
          label: 'Fraud risk',
          value: 'Low (stub)',
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/// ================================
/// Status row
/// ================================
class _StatusRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatusRow({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
