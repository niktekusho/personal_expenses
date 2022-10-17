import 'package:flutter/material.dart';

import 'widgets/chart.dart';
import 'widgets/new_transaction_form.dart';
import 'widgets/transaction_list.dart';
import 'transaction.dart';

void main() {
  runApp(const PersonalExpensesApp());
}

const _appTitle = 'Personal Expenses';

class PersonalExpensesApp extends StatelessWidget {
  const PersonalExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
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
    // Transaction(
    //     title: 'New shoes', id: 't1', amount: -69.99, date: DateTime.now()),
    // Transaction(title: 'Coffee', id: 't2', amount: -0.99, date: DateTime.now()),
    // Transaction(title: 'Juice', id: 't3', amount: -69.99, date: DateTime.now()),
    // Transaction(title: 'Check', id: 't4', amount: 100, date: DateTime.now()),
  ];

  void _addNewTransaction({
    required String title,
    required double amount,
    required DateTime date,
  }) {
    final newTransaction = Transaction(
      title: title,
      id: DateTime.now().toIso8601String(),
      amount: amount,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    final oneWeekAgo = DateTime.now().subtract(Duration(days: 7));

    return _transactions
        .where((transaction) => transaction.isAfterDate(oneWeekAgo))
        .toList();
  }

  void _openNewTransactionForm(context) {
    showModalBottomSheet(
      context: context,
      builder: (_) =>
          NewTransactionForm(addTransactionCallback: _addNewTransaction),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(_appTitle),
      actions: [
        IconButton(
          onPressed: () => _openNewTransactionForm(context),
          icon: Icon(Icons.add),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = _buildAppBar(context);

    final appBodyHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    final availableHeight = appBodyHeight - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: appBar,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              child: Chart(recentTransactions: _transactions),
              height: availableHeight * 0.4),
          Container(
            height: availableHeight * 0.6,
            child: TransactionList(
              transactions: _transactions,
              deleteTransactionCallback: _deleteTransaction,
            ),
          )
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
