import 'package:flutter/material.dart';

class OrderPad extends StatelessWidget {
  final Map<String, dynamic> stock;
  final String orderType;

  const OrderPad({super.key, required this.stock, required this.orderType});

  @override
  Widget build(BuildContext context) {
    final isBuy = orderType == 'buy';
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isBuy ? Colors.greenAccent : Colors.redAccent,
        title: Text('${isBuy ? "Buy" : "Sell"} - ${stock['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: isBuy ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: isBuy
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          child: Icon(
                            isBuy ? Icons.trending_up : Icons.trending_down,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Text(
                          stock['symbol'],
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: isBuy ? Colors.green[800] : Colors.red[800],
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Icon(
                          Icons.format_list_numbered,
                          size: 20,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${stock['quantity']} Qty",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 20,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "₹${stock['price']}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isBuy
                      ? Colors.greenAccent
                      : Colors.redAccent,
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: Icon(isBuy ? Icons.shopping_cart_checkout : Icons.sell),
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text("${isBuy ? "Buy" : "Sell"} Now"),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
