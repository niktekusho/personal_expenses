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

  // Transaction.copy(Transaction otherTransaction)
  //     : this(
  //           amount: otherTransaction.amount,
  //           date: otherTransaction.date,
  //           id: otherTransaction.id,
  //           title: otherTransaction.title);
}
