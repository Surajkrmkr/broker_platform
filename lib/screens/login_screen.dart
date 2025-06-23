import 'package:broker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/broker_selector.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedBroker = '';

  void login(String broker) {
    setState(() {
      selectedBroker = broker;
    });

    // Mocked response logic
    final responseCode = [200, 400, 500][broker.length % 3]; // just for mock

    if (responseCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else if (responseCode == 400) {
      _showSnackBar('Invalid credentials');
    } else {
      _showSnackBar('Server error. Try again later.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: Theme.of(context).textTheme.bodyMedium),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Broker App'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Select Broker',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              BrokerSelector(onBrokerSelected: login),
            ],
          ),
        ),
      ),
    );
  }
}
