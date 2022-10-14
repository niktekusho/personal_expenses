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

  void _submitForm() {
    final amountText = amountController.text;
    final title = titleController.text;

    if (title.isNotEmpty && amountText.isNotEmpty) {
      final amount = double.parse(amountText);
      addTransactionCallback(
        amount: amount,
        title: title,
      );
    }
  }

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
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              onSubmitted: (_) => _submitForm(),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: OutlinedButton(
                child: Text('Add transaction'),
                onPressed: _submitForm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
