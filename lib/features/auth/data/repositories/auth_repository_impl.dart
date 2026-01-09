import 'package:localharvest_canada/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:localharvest_canada/features/auth/domain/entities/user.dart';
import 'package:localharvest_canada/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<User> login(String email, String password) {
    return remoteDatasource.login(email, password);
  }

  @override
  Future<User> register(String name, String email, String password) {
    return remoteDatasource.register(name, email, password);
  }
}
