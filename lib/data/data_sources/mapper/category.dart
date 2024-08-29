import 'dart:ui';

import '../../../core/di/injectable.dart';
import '../../../domain/enums/category_type.dart';
import '../../../domain/repositories/auth_service.dart';
import '../../models/category_model.dart';

import '../../../domain/entities/category.dart';

// TODO mapper issue
mixin CategoryMapper {
  Category categoryModelToEntity(CategoryModel model) {
    return Category(
      id: model.id,
      name: model.name,
      type: model.isIncome ? CategoryType.income : CategoryType.expense,
      color: Color(int.parse(model.color ?? '0xFFFFFFFF')), //  TODO work here
    );
  }

  CategoryModel categoryEntityToModel(Category entity) {
    return CategoryModel(
      user: getIt<AuthService>().userId!,
      id: entity.id,
      name: entity.name,
      isIncome: entity.type == CategoryType.income,
      color:
          entity.color.toString().replaceAll('Color(', '').replaceAll(')', ''),
    );
  }
}
