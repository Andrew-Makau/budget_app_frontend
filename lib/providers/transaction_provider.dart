import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';


// TransactionNotifier manages the list of transactions
class TransactionNotifier extends StateNotifier<List<Transaction>> {
  TransactionNotifier()
      : super([
          // Optional initial mock data
          Transaction(
            type: 'Income',
            amount: 5000,
            category: 'Salary',
            date: DateTime.parse('2025-09-01'),
          ),
          Transaction(
            type: 'Expense',
            amount: 1500,
            category: 'Groceries',
            date: DateTime.parse('2025-09-05'),
          ),
          Transaction(
            type: 'Expense',
            amount: 800,
            category: 'Transport',
            date: DateTime.parse('2025-09-07'),
          ),
        ]);

  /// ✅ addTransaction is now correctly inside the class
  void addTransaction(
  String type,
  double amount,
  String category,
  DateTime date, {
  String? note,
}) {
  state = [
    ...state,
    Transaction(type: type, amount: amount, category: category, date: date, note: note),
  ];
}
}

// Global provider
final transactionProvider =
    StateNotifierProvider<TransactionNotifier, List<Transaction>>(
  (ref) => TransactionNotifier(),
);
