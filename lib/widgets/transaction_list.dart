import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/utils.dart';

import '../transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  Widget _buildTransactionListItem(BuildContext context, int index) {
    final transaction = transactions[index];

    return Card(
      child: Row(
        children: [
          Container(
            // TODO: not very good. Probably a better layout would be a grid!
            width: 120,
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Text('${transaction.amount.toStringAsFixed(2)} €',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'monospace',
                  color:
                      transaction.isExpense ? Colors.redAccent : Colors.green,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                formatDate(transaction.date),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
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

    return Container(
        // TODO: an other fixed size...
        height: 300,
        child: widgetBody);
  }
}
