class Transaction {
  final String title;
  final String id;
  final double amount;
  final DateTime date;

  Transaction({
    required this.title,
    required this.id,
    required this.amount,
    required this.date,
  });

  bool get isExpense {
    return amount < 0;
  }

  bool isAfterDate(DateTime dateTime) {
    return date.isAfter(dateTime);
  }

  // Transaction.copy(Transaction otherTransaction)
  //     : this(
  //           amount: otherTransaction.amount,
  //           date: otherTransaction.date,
  //           id: otherTransaction.id,
  //           title: otherTransaction.title);
}

class GroupedTransactions {
  final String day;
  double amount = 0;

  GroupedTransactions({required this.day});

  void addTransactionAmount(double amount) {
    this.amount += amount;
  }
}
