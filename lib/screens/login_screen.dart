import 'package:flutter/material.dart';
import 'package:oja/components/base_auth_form.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

import 'package:oja/screens/home_screen.dart';

// login_screen.dart
class LoginScreen extends StatelessWidget {
  final void Function(String email, String password) onLogin;
  final void Function() onGoogleLogin;
  final void Function() onAppleLogin;
  final VoidCallback onNavigateToSignup;

  const LoginScreen({
    super.key,
    required this.onLogin,
    required this.onGoogleLogin,
    required this.onAppleLogin,
    required this.onNavigateToSignup,
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
              isLogin: true,
              onSubmit: (email, password, _){
                if(email.isNotEmpty && password.isNotEmpty){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(children: [
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Divider(),
                )
              ]),
            ),
            const Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: GoogleLogoButton(),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppleLoginButton(),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 94, 168, 229),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style:
                      TextStyle(color: Color.fromARGB(255, 189, 184, 184)),
                    ),
                    GestureDetector(
                      onTap: onNavigateToSignup,
                      child: const Text(
                        ' Register',
                        style: TextStyle(
                            color: Color.fromARGB(255, 94, 168, 229),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TopAuthImageWelcomeDisplay extends StatelessWidget {
  const TopAuthImageWelcomeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(image: AssetImage('assets/splash_screen.png')),
        SizedBox(
          height: 20,
        ),
        Text(
          'Welcome to OJA Int store',
          style: TextStyle(
              color: Color.fromARGB(255, 1, 16, 28),
              fontWeight: FontWeight.w700,
              fontSize: 24),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Sign in to continue',
          style: TextStyle(
              color: Color.fromRGBO(18, 19, 21, 0.494),
              fontWeight: FontWeight.w600,
              fontSize: 15),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class GoogleLogoButton extends StatelessWidget {
  const GoogleLogoButton({super.key});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomPaint(
              size: const Size(20, 20),
              painter: GoogleLogoPainter(),
            ),
            const SizedBox(width: 100),
            const Text(
              'Login with Google',
              style: TextStyle(
                color: Color.fromARGB(255, 189, 184, 184),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(Icons.apple, color: Colors.black),
            SizedBox(width: 100),
            Text(
              'Login with Apple',
              style: TextStyle(
                color: Color.fromARGB(255, 189, 184, 184),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Define paints with Google's brand colors
    final redPaint = Paint()..color = const Color(0xFFEA4335); // Google red
    final bluePaint = Paint()..color = const Color(0xFF4285F4); // Google blue
    final greenPaint = Paint()..color = const Color(0xFF34A853); // Google green
    final yellowPaint = Paint()
      ..color = const Color(0xFFFBBC05); // Google yellow

    // Draw the colored arcs (approximation of Google logo)
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Red arc (300° to 360°)
    canvas.drawArc(
      rect,
      radians(300),
      radians(60),
      true,
      redPaint,
    );

    // Blue arc (180° to 240°)
    canvas.drawArc(
      rect,
      radians(180),
      radians(60),
      true,
      bluePaint,
    );

    // Green arc (60° to 120°)
    canvas.drawArc(
      rect,
      radians(60),
      radians(60),
      true,
      greenPaint,
    );

    // Yellow arc (0° to 60°)
    canvas.drawArc(
      rect,
      radians(0),
      radians(60),
      true,
      yellowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  // Helper to convert degrees to radians
  double radians(double degrees) => degrees * (pi / 180);
}
