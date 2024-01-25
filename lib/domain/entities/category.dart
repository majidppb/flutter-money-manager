enum CategoryType {
  income,
  expense,
}

final class Category {
  final int id;
  final String name;
  final CategoryType type;

  Category({
    required this.id,
    required this.name,
    required this.type,
  });
}
