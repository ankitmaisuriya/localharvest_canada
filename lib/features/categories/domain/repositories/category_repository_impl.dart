import 'package:localharvest_canada/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:localharvest_canada/features/categories/domain/entities/category.dart';
import 'package:localharvest_canada/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Category>> getCategories() async {
    return await remoteDataSource.getCategories();
  }
}
