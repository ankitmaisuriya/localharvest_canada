import 'package:localharvest_canada/features/auth/domain/entities/user.dart';

import '../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository authRepository;

  LoginUser(this.authRepository);

  Future<User> call(String email, String password) {
    return authRepository.login(email, password);
  }
}
