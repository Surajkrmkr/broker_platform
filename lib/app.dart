import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class BrokerApp extends StatelessWidget {
  const BrokerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquide Broker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const LoginScreen(),
    );
  }
}
