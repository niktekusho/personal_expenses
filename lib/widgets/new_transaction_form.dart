import 'package:flutter/material.dart';

class NewTransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
