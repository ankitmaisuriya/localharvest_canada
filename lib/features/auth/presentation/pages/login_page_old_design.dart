import 'package:flutter/material.dart';
import 'package:localharvest_canada/config/routes/app_routes.dart';
import 'package:localharvest_canada/features/auth/presentation/widgets/auth_button.dart';
import 'package:localharvest_canada/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthSuccess) {
          // print("Success");
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
        if (state is AuthError) {
          // print("${state.message}");
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                // transform: Matrix4.translationValues(0, -40, 0),
                padding: const EdgeInsets.all(20),
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sunrise_harvest.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(24),
                  // boxShadow: [
                  //   BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12),
                  // ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Login to ',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'LocalHarvest',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Text(
                      //   'Login to LocalHarvest',
                      //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                      // ),
                      const SizedBox(height: 20),
                      AuthTextField(
                        hint: 'Email',
                        icon: Icons.email_outlined,
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      AuthTextField(
                        hint: 'Password',
                        icon: Icons.lock_outline,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),
                      AuthButton(
                        text: state is AuthLoading ? 'Logging in...' : 'Login',
                        onPressed: () {
                          if (state is AuthLoading) return;

                          context.read<AuthCubit>().login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
                      ),
                      // AuthButton(
                      //   text: 'Static',
                      //   onPressed: () {
                      //     emailController.text = "ankit@example.com";
                      //     passwordController.text = "12345";
                      //   },
                      // ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                text: 'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
