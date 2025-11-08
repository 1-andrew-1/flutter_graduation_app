import 'package:flutter/material.dart';
import 'package:flutter_graduation_app/Screens/Auth/lex_login_form.dart';

class LexLoginPage extends StatelessWidget {
  const LexLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: LexLoginForm(
            onSignUp: () => debugPrint("Navigate to Sign Up"),
            onForgotPassword: () => debugPrint("Forgot Password Clicked"),
            onLogin: (email, password) {
              debugPrint("Login: $email, $password");
            },
          ),
        ),
      ),
    );
  }
}
