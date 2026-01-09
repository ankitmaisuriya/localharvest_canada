import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/core/errors/auth_exception.dart';
import 'package:localharvest_canada/features/auth/domain/usecases/register_user.dart';
import '../../domain/usecases/login_user.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthCubit({required this.loginUser, required this.registerUser})
    : super(AuthInitial());

  // LOGIN
  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      final user = await loginUser(email, password);
      emit(AuthSuccess(user));
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    } catch (e) {
      // Fallback for unexpected errors
      emit(AuthError('Something went wrong. Please try again.'));
    }
  }

  // REGISTER
  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await registerUser(name, email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError('Registration failed: $e'));
    }
  }
}
