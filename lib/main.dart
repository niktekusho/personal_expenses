import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
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
        title: 'New shoes', id: 't1', amount: -69.99, date: DateTime.now()),
    Transaction(title: 'Coffee', id: 't2', amount: -0.99, date: DateTime.now()),
    Transaction(title: 'Juice', id: 't3', amount: -69.99, date: DateTime.now()),
    Transaction(title: 'Check', id: 't4', amount: 100, date: DateTime.now()),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  ExpensesMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionWidgets = transactions.map((transaction) => Card(
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
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Text('${transaction.amount.toStringAsFixed(2)} €',
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
        ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Text('Chart'),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: OutlinedButton(
                        child: Text('Add transaction'),
                        onPressed: () {
                          print(titleController.text);
                          print(amountController.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...transactionWidgets,
          ]),
    );
  }
}
