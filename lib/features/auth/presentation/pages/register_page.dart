import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/config/routes/app_routes.dart';
import 'package:localharvest_canada/core/utils/validators.dart';
import 'package:localharvest_canada/core/widgets/responsive_layout.dart';
import 'package:localharvest_canada/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:localharvest_canada/features/auth/presentation/cubit/auth_state.dart';
import 'package:localharvest_canada/features/auth/presentation/widgets/auth_button.dart';
import 'package:localharvest_canada/features/auth/presentation/widgets/auth_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void  _register(BuildContext context) {
    final fullName = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    if (!isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    if (!isValidPassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password must be at least 6 characters')),
      );
      return;
    }

    context.read<AuthCubit>().register(fullName, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      child: Scaffold(
        backgroundColor: Colors.green.shade50,
        body: SafeArea(
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                // Show loading dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                );
              } else if (state is AuthSuccess) {
                // Dismiss loading
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Congrats! Successfully registered.')),
                );
                // Navigate to Home
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              } else if (state is AuthError) {
                // Dismiss loading
                Navigator.of(context).pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Stack(
              children: [
                Container(color: Colors.white),
                // Top Image
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/top_banner.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 260, // adjust as per your design
                  ),
                ),
                // Bottom image
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadiusGeometry.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                    child: Image.asset(
                      'assets/images/bottom_banner.png',
                      fit: BoxFit.fill,
                      width: double.infinity,

                      height: 240, // adjust as per your design
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0, 0, 0),
                          padding: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Create Your Account',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              AuthTextField(
                                hint: 'Full Name',
                                icon: Icons.person_outline,
                                controller: nameController,
                              ),
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
                                isPassword: true,
                              ),
                              const SizedBox(height: 20),
                              AuthButton(
                                text: 'Create Account',
                                onPressed: () {
                                  _register(context);
                                },
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(color: Colors.green),
                                    children: [
                                      TextSpan(
                                        text: 'Login',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
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
    );
  }
}
