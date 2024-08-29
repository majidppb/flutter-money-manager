class CategoryModel {
  final String user;
  final String id;
  final String name;
  final bool isIncome;
  final String? color;

  const CategoryModel({
    required this.user,
    required this.id,
    required this.name,
    required this.isIncome,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        user: '',
        id: json['id'] as String,
        name: json['name'] as String,
        isIncome: json['isIncome'] as bool,
        color: json['color'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user,
        'id': id,
        'name': name,
        'isIncome': isIncome,
        'color': color,
      };
}
