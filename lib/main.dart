import 'package:flutter/material.dart';
import 'package:oja/screens/splash_screen.dart';

// Defining Custom Colors
Color primary = const Color(0xff072227);
Color secondary = const Color(0xff35858B);
Color primaryLight = const Color(0xff4FBDBA);
Color secondaryLight = const Color(0xffAEFEFF);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Oja Ecommerce Application',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const SplashScreen(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Home Page'),
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.info))],
      ),
    );
  }
}
