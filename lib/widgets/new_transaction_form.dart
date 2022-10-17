import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/utils.dart';

/// Type definition used to narrow down the kind of functions passed to the form.
/// This callback is called on the user's tap of the button 'Add transaction'.
typedef AddTransactionCallback = void Function({
  required String title,
  required double amount,
  required DateTime date,
});

class NewTransactionForm extends StatefulWidget {
  final AddTransactionCallback addTransactionCallback;

  NewTransactionForm({super.key, required this.addTransactionCallback});

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime? _selectedDate;

  void _submitForm() {
    final amountText = amountController.text;
    final title = titleController.text;
    final selectedDate = _selectedDate;

    if (title.isNotEmpty && amountText.isNotEmpty && selectedDate != null) {
      final amount = double.parse(amountText);
      widget.addTransactionCallback(
        amount: amount,
        title: title,
        date: selectedDate,
      );

      Navigator.of(context).pop();
    }
  }

  void _openDatePicker() {
    final userChoice = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022), // 2022-01-01
      lastDate: DateTime.now(),
    );

    userChoice.then((userChosenDate) {
      if (userChosenDate == null) {
        print('Pressed cancel');
      } else {
        setState(() {
          _selectedDate = userChosenDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = _selectedDate;
    final printedDate = selectedDate == null //
        ? 'No date chosen'
        : formatDate(selectedDate);

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
              height: 72,
              child: Row(
                children: [
                  Expanded(child: Text(printedDate)),
                  TextButton(
                    onPressed: _openDatePicker,
                    child: Text(
                      'Choose date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: ElevatedButton(
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
