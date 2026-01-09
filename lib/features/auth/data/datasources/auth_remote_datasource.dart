import 'package:dio/dio.dart';
import 'package:localharvest_canada/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login(String email, String password);

  Future<UserModel> register(String name, String email, String password);
}
