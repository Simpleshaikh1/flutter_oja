import 'package:flutter/material.dart';
import 'package:oja/screens/login_screen.dart';
import 'package:oja/screens/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginScreen(
            onLogin: (email, password) => _handleLogin(email, password),
            onGoogleLogin: _handleGoogleLogin,
            onAppleLogin: _handleAppleLogin,
            onNavigateToSignup: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUpScreen(
                      onSignUp: (name, email, password) {
                        _handleSignUp(name, email, password);
                      },
                    )),
              );
            },
          )),
    );
  }

  void _handleLogin(String email, String password) {
    // Implement your login logic
    print('Logging in with $email');
  }

  void _handleGoogleLogin() {
    // Implement Google sign-in
    print('Google sign-in');
  }

  void _handleAppleLogin() {
    // Implement Apple sign-in
    print('Apple sign-in');
  }

  void _handleSignUp(String name, String email, String password) {
    debugPrint('Signing up: $name, $email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Centered logo
          const Center(
            child: Image(
              image: AssetImage('assets/splash_screen.png'),
              fit: BoxFit.contain,
            ),
          ),

          // Bottom blue bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              color: const Color.fromARGB(255, 1, 18, 42),
            ),
          ),
        ],
      ),
    );
  }
}
