import 'dart:ui';

import '../../../core/use_case.dart';
import '../../enums/category_type.dart';

final class NewOrUpdateCategoryParams extends Params {
  final String? id;
  final String name;
  final CategoryType type;
  final Color color;

  const NewOrUpdateCategoryParams({
    required this.id,
    required this.name,
    required this.type,
    required this.color,
  });
}
