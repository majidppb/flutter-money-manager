class CategoryModel {
  int id;
  String name;
  String type;

  CategoryModel({required this.id, required this.name, required this.type});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int,
        name: json['name'] as String,
        type: json['category'] as String,
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'category': type};
}
