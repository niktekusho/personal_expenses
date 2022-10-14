import 'package:flutter/material.dart';

/// Type definition used to narrow down the kind of functions passed to the form.
/// This callback is called on the user's tap of the button 'Add transaction'.
typedef AddTransactionCallback = void Function({
  required String title,
  required double amount,
});

class NewTransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final AddTransactionCallback addTransactionCallback;

  NewTransactionForm({super.key, required this.addTransactionCallback});

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
                  addTransactionCallback(
                      amount: double.parse(amountController.text),
                      title: titleController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
