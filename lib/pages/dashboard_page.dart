// lib/pages/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/transaction_provider.dart';
import '../models/transaction.dart'; // optional - for types

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Transaction> transactions = ref.watch(transactionProvider);

    final double balance = transactions.fold(
      0.0,
      (double sum, Transaction t) =>
          t.type == 'Income' ? sum + t.amount : sum - t.amount,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade100,
            child: Text(
              "Balance: \$${balance.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tx = transactions[index];
                return ListTile(
                  title: Text("${tx.category} - \$${tx.amount.toStringAsFixed(2)}"),
                  subtitle: Text("${tx.date.toLocal()} (${tx.type})".split(' ')[0]),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-transaction');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
