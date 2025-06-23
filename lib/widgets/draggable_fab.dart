import 'package:flutter/material.dart';
import '../screens/order_pad.dart';
import '../data/mock_data.dart';

class DraggableFAB extends StatefulWidget {
  final int currentScreenIndex;

  const DraggableFAB({super.key, required this.currentScreenIndex});

  @override
  State<DraggableFAB> createState() => _DraggableFABState();
}

class _DraggableFABState extends State<DraggableFAB> {
  Offset position = const Offset(32, 600);
  bool isExpanded = false;

  void _handleOrder(BuildContext context, String type) {
    final List<Map<String, Object>> currentStocks;

    // pick list based on current screen
    if (widget.currentScreenIndex == 0) {
      currentStocks = holdingsData;
    } else if (widget.currentScreenIndex == 1) {
      currentStocks = orderbookData;
    } else {
      currentStocks = positionsData;
    }

    // Select stock
    Map<String, Object> selectedStock;
    if (currentStocks.isNotEmpty) {
      selectedStock = currentStocks.first;
    } else {
      // fallback: pick first stock alphabetically from holdings
      List<Map<String, Object>> allStocks = [
        ...holdingsData,
        ...orderbookData,
        ...positionsData,
      ].toList();
      allStocks.sort(
        (a, b) => (a['name'] as String?)?.compareTo(b['name'] as String) ?? 0,
      );
      selectedStock = allStocks.isNotEmpty ? allStocks.first : {};
    }
    setState(() => isExpanded = !isExpanded);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderPad(stock: selectedStock, orderType: type),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isExpanded)
          Positioned(
            left: position.dx,
            top: position.dy - 140,
            child: Column(
              children: [
                FloatingActionButton.extended(
                  heroTag: 'buy_btn',
                  onPressed: () => _handleOrder(context, 'buy'),
                  label: const Text('Buy'),
                  backgroundColor: Colors.greenAccent,
                ),
                const SizedBox(height: 10),
                FloatingActionButton.extended(
                  heroTag: 'sell_btn',
                  onPressed: () => _handleOrder(context, 'sell'),
                  label: const Text('Sell'),
                  backgroundColor: Colors.redAccent,
                ),
              ],
            ),
          ),
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Draggable(
            feedback: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {},
              child: Icon(
                Icons.compare_arrows,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            childWhenDragging: const SizedBox.shrink(),
            onDragEnd: (details) {
              final RenderBox renderBox =
                  context.findRenderObject() as RenderBox;
              final Size screenSize = renderBox.size;
              final double fabSize = 56.0; // Default FAB size

              double newDx = details.offset.dx.clamp(
                32.0,
                screenSize.width - fabSize,
              );
              double newDy = details.offset.dy.clamp(
                0.0,
                screenSize.height - fabSize,
              );

              setState(() {
                position = Offset(newDx, newDy);
              });
            },
            child: FloatingActionButton(
              elevation: 2,
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () => setState(() => isExpanded = !isExpanded),
              child: Icon(
                isExpanded ? Icons.close : Icons.compare_arrows,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
