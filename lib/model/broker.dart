import 'package:flutter/material.dart';

class Broker {
  final String name;
  final Color color;

  Broker({required this.name, required this.color});
}

final List<Broker> brokers = [
  Broker(name: 'Zerodha', color: Colors.blue),
  Broker(name: 'Upstox', color: Colors.deepPurple),
  Broker(name: 'AngelOne', color: Colors.green),
  Broker(name: 'Groww', color: Colors.teal),
];
