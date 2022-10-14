import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions
            .map((transaction) => Card(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        // color: Colors.red,
                        // alignment: Alignment.centerLeft,

                        // TODO: not very good. Probably a better layout would be a grid!
                        width: 120,
                        margin: EdgeInsets.all(4),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child:
                            Text('${transaction.amount.toStringAsFixed(2)} €',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'monospace',
                                  color: transaction.isExpense
                                      ? Colors.redAccent
                                      : Colors.green,
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
                ))
            .toList());
  }
}
