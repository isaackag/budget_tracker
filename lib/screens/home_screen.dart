import 'package:budget_tracker/models/transaction.dart';
import 'package:budget_tracker/widgets/add_transaction_dialog.dart';
import 'package:budget_tracker/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transaction> items = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return AddTransactionDialog(itemToAdd: (transaction) {
                  setState(() {
                    items.add(transaction);
                  });
                });
              }));
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircularPercentIndicator(
                    animation: true,
                    radius: screenSize.width / 2,
                    lineWidth: 10.0,
                    percent: 0.5,
                    backgroundColor: Colors.white,
                    progressColor: Theme.of(context).colorScheme.primary,
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '\$0',
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Items',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...List.generate(items.length,
                    (index) => TransactionCard(transaction: items[index])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
