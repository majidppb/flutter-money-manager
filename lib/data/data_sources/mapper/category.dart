import '../../models/category_model.dart';

import '../../../domain/entities/category.dart';

mixin CategoryMapper {
  Category categoryModelToEntity(CategoryModel model) {
    return Category(
      id: model.id,
      name: model.name,
      type: model.type == 'i' ? CategoryType.income : CategoryType.expense,
    );
  }

  CategoryModel categoryEntityToModel(Category entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      type: entity.type == CategoryType.income ? 'i' : 'e',
    );
  }
}
