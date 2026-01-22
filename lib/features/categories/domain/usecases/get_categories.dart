import 'package:localharvest_canada/features/categories/domain/entities/category.dart';
import 'package:localharvest_canada/features/categories/domain/repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
