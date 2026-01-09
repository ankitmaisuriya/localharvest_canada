import 'package:localharvest_canada/features/auth/domain/entities/user.dart';
import 'package:localharvest_canada/features/auth/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository authRepository;

  RegisterUser(this.authRepository);

  Future<User> call(String name, String email, String password) {
    return authRepository.register(name, email, password);
  }
}
