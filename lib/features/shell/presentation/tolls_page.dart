import 'package:flutter/material.dart';

class TollsPage extends StatelessWidget {
  const TollsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Оплата доріг',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          'MVP stub: тут буде EETS / tolling flow.\n\n'
          'План:\n'
          '• Вибір країни / сервісу\n'
          '• Активна сесія tolling\n'
          '• Статуси + інвойсинг\n'
          '• Fraud / compliance checks',
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Стан: Coming soon'),
                SizedBox(height: 8),
                Text('Наступний крок: інтеграція з tolling backend (Phase 2).'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
