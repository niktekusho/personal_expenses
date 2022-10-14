import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction_form.dart';
import 'package:personal_expenses/widgets/user_transactions.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(const PersonalExpensesApp());
}

class PersonalExpensesApp extends StatelessWidget {
  const PersonalExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpensesMainPage(),
    );
  }
}

class ExpensesMainPage extends StatelessWidget {
  ExpensesMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Text('Chart'),
              ),
              UserTransactions(),
            ]),
      ),
    );
  }
}
