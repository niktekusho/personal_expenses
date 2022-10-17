import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/utils.dart';

import '../transaction.dart';

typedef DeleteTransactionCallback = void Function(String id);

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final DeleteTransactionCallback deleteTransactionCallback;

  const TransactionList({
    super.key,
    required this.transactions,
    required this.deleteTransactionCallback,
  });

  Widget _buildTransactionListItem(BuildContext context, int index) {
    final transaction = transactions[index];

    return Card(
      child: ListTile(
        leading: Text('${transaction.amount.toStringAsFixed(2)} €',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'monospace',
              color: transaction.isExpense ? Colors.redAccent : Colors.green,
            )),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          formatDate(transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
          onPressed: () => deleteTransactionCallback(transaction.id),
        ),
      ),
    );
  }

  Widget _buildNoTransactionsWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          'No transactions added yet!',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final widgetBody = transactions.isEmpty
        ? _buildNoTransactionsWidget(context)
        : ListView.builder(
            itemBuilder: _buildTransactionListItem,
            itemCount: transactions.length,
          );

    return widgetBody;
  }
}
