import 'package:flutter/material.dart';

class PNLCard extends StatelessWidget {
  final String realized;
  final String unrealized;

  const PNLCard({
    super.key,
    required this.realized,
    required this.unrealized,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PNL Summary', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPNL('Realized', realized),
                _buildPNL('Unrealized', unrealized),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPNL(String label, String value) {
    final isProfit = value.startsWith('+');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: isProfit ? Colors.green : Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
