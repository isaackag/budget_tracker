import 'package:budget_tracker/screens/home_screen.dart';
import 'package:budget_tracker/screens/profile_screen.dart';
import 'package:budget_tracker/widgets/add_budget_dialog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  List<Widget> pages = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Tracker'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AddBudgetDialog(
                        budgetToAdd: (budget) {},
                      );
                    }));
              }),
              icon: const Icon(Icons.attach_money))
        ],
      ),
      body: pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems,
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          }),
    );
  }
}
