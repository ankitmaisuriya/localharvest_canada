import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/config/routes/app_routes.dart';
import 'package:localharvest_canada/core/utils/validators.dart';
import 'package:localharvest_canada/core/widgets/responsive_layout.dart';
import 'package:localharvest_canada/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:localharvest_canada/features/auth/presentation/cubit/auth_state.dart';
import 'package:localharvest_canada/features/auth/presentation/widgets/auth_button.dart';
import 'package:localharvest_canada/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
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

    context.read<AuthCubit>().login(email, password);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) async {
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
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('userToken', state.user.id);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'You have successfully logged in to LocalHarvest, ${state.user.full_name}!',
                    ),
                  ),
                );
                // Navigate to Home
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              } else if (state is AuthError) {
                print("state massege --> ${state.message}");
                // Dismiss loading
                Navigator.of(context).pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Stack(
              children: [
                // Background
                Container(color: Colors.white),

                // Top Image
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/top_banner.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 260,
                  ),
                ),

                // Bottom Image
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
                // Login Card
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Login to ',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.green,
                              ),
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
                            isPassword: true,
                          ),
                          const SizedBox(height: 20),
                          AuthButton(
                            text: 'Login',
                            onPressed: () {
                              _login(context);
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
                              Navigator.pushReplacementNamed(
                                context,
                                '/register',
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(color: Colors.green),
                                children: [
                                  TextSpan(
                                    text: 'Register',
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
                        ],
                      ),
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
