import 'package:flutter/material.dart';
import 'package:oja/components/base_auth_form.dart';
import 'package:oja/screens/login_screen.dart';

// signup_screen.dart
class SignUpScreen extends StatelessWidget {
  final void Function(String name, String email, String password) onSignUp;

  const SignUpScreen({
    super.key,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          children: [
            const TopAuthImageWelcomeDisplay(),
            BaseAuthForm(
              isLogin: false,
              onSubmit: (email, password, name) {
                if (name != null) {
                  onSignUp(name, email, password);
                }
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account? ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 189, 184, 184),
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    ' Sign in',
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 168, 229),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
