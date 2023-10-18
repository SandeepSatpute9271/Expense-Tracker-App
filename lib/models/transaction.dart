class Transaction {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;

  // named arguments
  Transaction({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  });
}
