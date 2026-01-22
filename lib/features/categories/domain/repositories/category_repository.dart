import 'package:localharvest_canada/features/categories/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}
