import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  Widget _buildTransactionListItem(BuildContext ctx, int index) {
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Theme.of(ctx).primaryColorDark,
                ),
              ),
              Text(
                DateFormat.yMEd().format(transaction.date),
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

  @override
  Widget build(BuildContext context) {
    return Container(
        // TODO: an other fixed size...
        height: 300,
        child: ListView.builder(
          itemBuilder: _buildTransactionListItem,
          itemCount: transactions.length,
        ));
  }
}
