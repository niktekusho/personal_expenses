import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';
import '../transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  List<GroupedTransactions> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDayDateTime = DateTime.now().subtract(Duration(days: index));
      final weekDayName = DateFormat.E().format(weekDayDateTime);

      final groupedTransactions = GroupedTransactions(day: weekDayName);

      for (var recentTransaction in recentTransactions) {
        if (_isSameDay(recentTransaction.date, weekDayDateTime)) {
          groupedTransactions.addTransactionAmount(recentTransaction.amount);
        }
      }

      return groupedTransactions;
    });
  }

  double get maxAmountTransaction {
    return groupedTransactionValues.fold(
        0.0, (currentSum, element) => currentSum + element.amount);
  }

  @override
  Widget build(BuildContext context) {
    final maxAmount = maxAmountTransaction;

    final groupedTransactionWidgets = groupedTransactionValues
        .map((gt) => BarChart(
              label: gt.day,
              spendedAmount: gt.amount,
              maxAmount: maxAmount,
            ))
        .toList();

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionWidgets,
        ),
      ),
    );
  }
}
