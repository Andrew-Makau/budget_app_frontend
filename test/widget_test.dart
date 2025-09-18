import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budget_app_frontend/pages/dashboard_page.dart';
import 'package:budget_app_frontend/providers/transaction_provider.dart';

void main() {
  testWidgets('Transaction shows up in Dashboard', (WidgetTester tester) async {
    // Wrap in ProviderScope so Riverpod works
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: DashboardPage())),
    );

    // At first, no transactions should exist
    expect(find.text("Transactions:"), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);

    // Add a transaction via provider
    final container = ProviderContainer();
    container.read(transactionProvider.notifier).addTransaction(
      "Test Item", // title
      50,          // amount
      "Test Category", // category (example value)
      DateTime.now(), // date (example value)
    );

    // Rebuild widget with updated provider state
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: DashboardPage()),
      ),
    );
    await tester.pump();

    // Verify transaction appears in the list
    expect(find.text("Test Item"), findsOneWidget);
    expect(find.text("\$50.0"), findsOneWidget);
  });
}
