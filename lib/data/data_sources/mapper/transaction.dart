import '../../../domain/entities/transaction.dart';
import '../../../domain/repositories/transactions.dart';
import '../../models/transaction_model.dart';

mixin TransactionMapper {
  Transaction transactionModelToEntity(TransactionModel model) {
    return Transaction(
      id: model.id,
      purpose: model.purpose,
      amount: model.amount,
      date: model.date,
      category: (this as TransactionsRepository).getCategory(model.category),
    );
  }

  TransactionModel transactionEntityToModel(Transaction entity) {
    return TransactionModel(
      id: entity.id,
      purpose: entity.purpose,
      amount: entity.amount,
      date: entity.date,
      category: entity.category.id,
    );
  }
}
