import 'dart:ui';

import '../enums/category_type.dart';

final class Category {
  final String id;
  final String name;
  final CategoryType type;
  final Color color;

  const Category({
    required this.id,
    required this.name,
    required this.type,
    required this.color,
  });
}
