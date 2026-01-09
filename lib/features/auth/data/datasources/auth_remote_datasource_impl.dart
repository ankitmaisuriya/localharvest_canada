import 'package:dio/dio.dart';
import 'package:localharvest_canada/core/network/api_endpoints.dart';
import 'package:localharvest_canada/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:localharvest_canada/features/auth/data/models/user_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<UserModel> login(String email, String password) async {
    // TODO: implement login
    final response = await dio.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    print("response.statusCode -> ${response.statusCode}");
    print("response.toString() -> ${response.toString()}");
    return UserModel.fromJson(response.data['user']);
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final response = await dio.post(
      ApiEndpoints.register,
      data: {"full_name": name, "email": email, "password_hash": password},
    );
    print("response.statusCode -> ${response.statusCode}");
    print("response.toString() -> ${response.toString()}");
    return UserModel.fromJson(response.data['user']);
  }
}
