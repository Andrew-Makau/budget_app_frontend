import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/add_transaction_page.dart';

void main() {
  runApp(const ProviderScope(child: BudgetApp())); // ✅ ProviderScope added
}

class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Budget App",
      theme: ThemeData(primarySwatch: Colors.blue),
      // App starts with the Login page
      initialRoute: '/login',
      // Routes map (page name → screen widget)
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/add-transaction': (context) => const AddTransactionPage(),
      },
    );
  }
}
