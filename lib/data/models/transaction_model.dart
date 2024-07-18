class TransactionModel {
  final String user;
  final String id;
  final String purpose;
  final double amount;
  final DateTime date;
  final String category;

  const TransactionModel({
    required this.user,
    required this.id,
    required this.purpose,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      user: '',
      id: json['id'] as String,
      purpose: json['purpose'] as String,
      amount: json['amount'] as double,
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user,
        'id': id,
        'purpose': purpose,
        'amount': amount,
        'date': date.toIso8601String(),
        'category': category
      };
}
