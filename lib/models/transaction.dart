// lib/models/transaction.dart
class Transaction {
  final String type;     // "Income" or "Expense"
  final double amount;
  final String category;
  final DateTime date;
  final String? note;    // optional

  Transaction({
    required this.type,
    required this.amount,
    required this.category,
    required this.date,
    this.note,
  });

  @override
  String toString() =>
      'Transaction(type: $type, amount: $amount, category: $category, date: $date, note: $note)';
}
