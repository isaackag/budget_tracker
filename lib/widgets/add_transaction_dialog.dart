// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:budget_tracker/models/transaction.dart';
import 'package:flutter/services.dart';

class AddTransactionDialog extends StatefulWidget {
  final Function(Transaction) itemToAdd;

  const AddTransactionDialog({
    Key? key,
    required this.itemToAdd,
  }) : super(key: key);

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  bool isExpenseController = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                'Add a transaction',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: titleController,
                decoration:
                    const InputDecoration(hintText: 'Name of transaction'),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(hintText: 'Amount in \$'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Is Expense?'),
                  Switch.adaptive(
                      value: isExpenseController,
                      onChanged: ((value) {
                        setState(() {
                          isExpenseController = value;
                        });
                      })),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: (() {
                    if (amountController.text.isNotEmpty &&
                        titleController.text.isNotEmpty) {
                      widget.itemToAdd(Transaction(
                          text: titleController.text,
                          amount: double.parse(amountController.text),
                          isExpense: isExpenseController));
                      Navigator.pop(context);
                    }
                  }),
                  child: Text('Add')),
            ],
          ),
        ),
      ),
    );
  }
}
