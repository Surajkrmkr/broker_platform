import 'package:broker/model/broker.dart';
import 'package:flutter/material.dart';

class BrokerSelector extends StatelessWidget {
  final void Function(String brokerName) onBrokerSelected;

  const BrokerSelector({super.key, required this.onBrokerSelected});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      padding: const EdgeInsets.only(top: 10),
      itemCount: brokers.length,
      itemBuilder: (context, index) {
        final broker = brokers[index];
        return Card(
          child: InkWell(
            onTap: () => onBrokerSelected(broker.name),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: broker.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/brokers/${broker.name}.png', height: 40),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
