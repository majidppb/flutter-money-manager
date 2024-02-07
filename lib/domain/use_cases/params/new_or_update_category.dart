import '../../../core/use_case.dart';
import '../../entities/category.dart';

final class NewOrUpdateCategoryParams extends Params {
  final int? id;
  final String name;
  final CategoryType type;

  NewOrUpdateCategoryParams({
    required this.id,
    required this.name,
    required this.type,
  });
}
