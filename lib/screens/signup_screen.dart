import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              
              // Logo
              Image.asset(
                'assets/images/axonix_logo.png',
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Axonix',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryCyan,
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 24),
              
              // Tagline
              const Text(
                'Your Intelligent Memory Companion',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.primaryCyan,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
              const SizedBox(height: 80),
              
              // Full Name Input
              CustomInputField(
                hintText: 'Full Name',
                controller: _nameController,
              ),
              
              const SizedBox(height: 16),
              
              // Email Input
              CustomInputField(
                hintText: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              
              const SizedBox(height: 16),
              
              // Password Input
              CustomInputField(
                hintText: 'Password',
                controller: _passwordController,
                isPassword: true,
              ),
              
              const SizedBox(height: 32),
              
              // Create Account Button
              CustomButton(
                text: 'Create Account',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/device-pairing');
                },
              ),
              
              const SizedBox(height: 24),
              
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.primaryCyan,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
