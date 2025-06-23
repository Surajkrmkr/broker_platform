import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/pnl_card.dart';

class PositionsScreen extends StatelessWidget {
  const PositionsScreen({super.key});

  void _showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: Theme.of(context).textTheme.bodyMedium),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PNLCard(realized: '+120', unrealized: '+80'),
        const SizedBox(height: 10),
        ...positionsData.map(
          (stock) => Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text((stock['symbol'] as String)[0]),
              ),
              title: Text(stock['name'] as String),
              subtitle: Text(
                'Qty: ${stock['quantity']} • ₹${stock['price']} • PNL: ${stock['pnl']}',
              ),
              trailing: Icon(
                Icons.trending_up,
                color: (stock['pnl'] as String).startsWith('+')
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
              onTap: () => _showSnackBar('Tapped on ${stock['name']}', context),
            ),
          ),
        ),
      ],
    );
  }
}
