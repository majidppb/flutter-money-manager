final class TransactionModel {
  final String id;
  final String purpose;
  final double amount;
  final DateTime date;
  final int category;

  const TransactionModel({
    required this.id,
    required this.purpose,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      purpose: json['purpose'] as String,
      amount: json['amount'] as double,
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'purpose': purpose,
        'amount': amount,
        'date': date,
        'category': category
      };
}
