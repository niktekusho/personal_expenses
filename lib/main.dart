import 'package:flutter/material.dart';
import 'transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
        title: 'New shoes', id: 't1', amount: 69.99, date: DateTime.now()),
    Transaction(title: 'Coffee', id: 't2', amount: 0.99, date: DateTime.now()),
    Transaction(title: 'Juice', id: 't3', amount: 69.99, date: DateTime.now()),
    Transaction(
        title: 'New shoes', id: 't4', amount: 69.99, date: DateTime.now()),
  ];

  ExpensesMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionWidgets = transactions.map((transaction) => Card(
          child: Row(
            children: [
              Container(
                child: Text(transaction.amount.toString()),
              ),
              Column(
                children: [
                  Text(transaction.title),
                  Text(transaction.date.toString()),
                ],
              ),
            ],
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: Column(children: [
        Card(
          child: Text('Chart'),
        ),
        ...transactionWidgets,
      ]),
    );
  }
}
