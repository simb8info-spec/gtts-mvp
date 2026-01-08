import 'package:flutter/material.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Готелі',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          'MVP stub: тут буде пошук готелів/паркінгів для водіїв.\n\n'
          'План:\n'
          '• Пошук по мапі/маршруту\n'
          '• Фільтри: парковка для фур, душ, охорона\n'
          '• Бронювання (deep links або інтеграція)\n'
          '• Оплата корпоративним кредитом (опціонально)',
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
                Text('Наступний крок: інтеграція з партнером (Booking/Google/агрегатор).'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
