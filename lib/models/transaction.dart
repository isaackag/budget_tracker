class Transaction {
  final String text;
  final double amount;
  final bool isExpense;

  const Transaction(
      {required this.text, required this.amount, required this.isExpense});
}
