import 'package:flutter/material.dart';
import 'package:localharvest_canada/config/routes/app_routes.dart';
import 'package:localharvest_canada/features/auth/presentation/widgets/auth_button.dart';
import 'package:localharvest_canada/features/auth/presentation/widgets/auth_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Top image Section
              Container(
                height: 260,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash_screen.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                // child: const Text('LocalHarvest Canada',
                // style: TextStyle(
                //   fontSize: 26,
                //   fontWeight: FontWeight.bold,
                //   color: Colors.white
                // ),),
              ),
              //card section
              Container(
                transform: Matrix4.translationValues(0, -40, 0),
                padding: const EdgeInsets.all(40),
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
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
                      'Login to LocalHarvest',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
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
                    ),
                    const SizedBox(height: 20),
                    AuthButton(text: 'Login', onPressed: () {}),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context,'/register');
                      },
                      child: const Text(
                        "Don't have an account? Register",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Image.asset('assets/images/splash_screen.png')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
