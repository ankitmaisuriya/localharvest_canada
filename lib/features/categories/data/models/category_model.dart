import 'package:localharvest_canada/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.id,
    required super.name,
    super.description,
    super.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageurl'],
    );
  }
}
