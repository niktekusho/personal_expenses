import 'package:flutter/widgets.dart';

import '../transaction.dart';
import 'new_transaction_form.dart';
import 'transaction_list.dart';

/// Widget that holds user's transactions.
/// When the user adds a new transaction, then the new transaction is added to a local list of transactions.
class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        title: 'New shoes', id: 't1', amount: -69.99, date: DateTime.now()),
    Transaction(title: 'Coffee', id: 't2', amount: -0.99, date: DateTime.now()),
    Transaction(title: 'Juice', id: 't3', amount: -69.99, date: DateTime.now()),
    Transaction(title: 'Check', id: 't4', amount: 100, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactionForm(),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
