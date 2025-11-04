import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/base_page.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../../application/services/auth_service.dart';

class LoginViewIOS extends StatefulWidget {
  const LoginViewIOS({super.key});

  @override
  State<LoginViewIOS> createState() => _LoginViewIOSState();
}

class _LoginViewIOSState extends State<LoginViewIOS> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final success = await _authService.login(
        _emailController.text,
        _passwordController.text,
      );

      setState(() => _isLoading = false);

      if (success && mounted) {
        context.go('/home');
      } else if (mounted) {
        // iOS style snackbar
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.person_circle, size: 80, color: AppColors.primary),
                const SizedBox(height: 32),
                Text(
                  AppStrings.loginTitle,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 48),
                CupertinoTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  placeholder: AppStrings.placeholderEmail,
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(CupertinoIcons.mail),
                  ),
                ),
                const SizedBox(height: 16),
                CupertinoTextField(
                  controller: _passwordController,
                  obscureText: true,
                  placeholder: AppStrings.placeholderPassword,
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(CupertinoIcons.lock),
                  ),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Entrar',
                  onPressed: _handleLogin,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

