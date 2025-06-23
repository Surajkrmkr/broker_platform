import 'package:broker/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'holdings_screen.dart';
import 'orderbook_screen.dart';
import 'positions_screen.dart';
import '../widgets/draggable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HoldingsScreen(),
    OrderbookScreen(),
    PositionsScreen(),
  ];

  final List<String> _titles = ["Holdings", "Orderbook", "Positions"];

  void _onNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_currentIndex]),
          centerTitle: true,
          actionsPadding: EdgeInsets.only(right: 16),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                'S',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
            ),
          ],
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart),
              label: 'Holdings',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Orderbook'),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Positions',
            ),
          ],
        ),
        floatingActionButton: DraggableFAB(currentScreenIndex: _currentIndex),
      ),
    );
  }
}
