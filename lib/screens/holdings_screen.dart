import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class HoldingsScreen extends StatelessWidget {
  const HoldingsScreen({super.key});

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
    return ListView.builder(
      itemCount: holdingsData.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final stock = holdingsData[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(child: Text((stock['symbol'] as String)[0])),
            title: Text(stock['name'] as String),
            subtitle: Text('Qty: ${stock['quantity']} • ₹${stock['price']}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showSnackBar('Tapped on ${stock['name']}', context),
          ),
        );
      },
    );
  }
}
