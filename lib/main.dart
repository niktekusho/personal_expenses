import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction_form.dart';
import './widgets/transaction_list.dart';
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

class ExpensesMainPage extends StatefulWidget {
  ExpensesMainPage({super.key});

  @override
  State<ExpensesMainPage> createState() => _ExpensesMainPageState();
}

class _ExpensesMainPageState extends State<ExpensesMainPage> {
  final List<Transaction> _transactions = [
    Transaction(
        title: 'New shoes', id: 't1', amount: -69.99, date: DateTime.now()),
    Transaction(title: 'Coffee', id: 't2', amount: -0.99, date: DateTime.now()),
    Transaction(title: 'Juice', id: 't3', amount: -69.99, date: DateTime.now()),
    Transaction(title: 'Check', id: 't4', amount: 100, date: DateTime.now()),
  ];

  void _addNewTransaction({required String title, required double amount}) {
    final newTransaction = Transaction(
      title: title,
      id: DateTime.now().toIso8601String(),
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _openNewTransactionForm(context) {
    showModalBottomSheet(
      context: context,
      builder: (_) =>
          NewTransactionForm(addTransactionCallback: _addNewTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: [
          IconButton(
            onPressed: () => _openNewTransactionForm(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Text('Chart'),
          ),
          TransactionList(transactions: _transactions)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openNewTransactionForm(context),
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openNewTransactionForm(context),
        ),
      ),
    );
  }
}
