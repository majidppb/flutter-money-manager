import '../enums/category_type.dart';

final class Category {
  final String id;
  final String name;
  final CategoryType type;

  const Category({
    required this.id,
    required this.name,
    required this.type,
  });
}
