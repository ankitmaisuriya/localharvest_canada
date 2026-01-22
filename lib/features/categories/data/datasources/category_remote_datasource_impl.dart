import 'package:dio/dio.dart';
import 'package:localharvest_canada/core/network/api_endpoints.dart';
import 'package:localharvest_canada/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:localharvest_canada/features/categories/data/models/category_model.dart';

class CategoryRemoteDatasourceImpl extends CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDatasourceImpl(this.dio);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get(ApiEndpoints.categories);
      final List data = response.data as List;
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}
