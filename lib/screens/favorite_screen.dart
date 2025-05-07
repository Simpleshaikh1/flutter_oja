import 'package:flutter/material.dart';
import 'package:oja/components/bottom_navbar.dart';
import 'package:oja/components/flashsale_container.dart';
import 'package:oja/components/last_home_section.dart';
import 'package:oja/components/search_product.dart';
import 'package:oja/screens/home_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FavoriteScreenContent(),
    const Center(child: Text('Search')),
    const Center(child: Text('Cart')),
    const Center(child: Text('Offers')),
    const Center(child: Text('Account')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Favorite Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(
          icon:  const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        // automaticallyImplyLeading: false,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                const SizedBox(width: 12,),
                SearchIcon(onTap: (){},),
                // IconButton(onPressed: (){}, icon: const Icon(Icons.search), color: Colors.black,)
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(height: 20, thickness: 2,),
            Expanded(child:_screens[_currentIndex])
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class FavoriteScreenContent extends StatelessWidget{
  const FavoriteScreenContent({super.key});

  @override
  Widget build(BuildContext context){
    return const SingleChildScrollView(
      padding:  EdgeInsets.all(16.0),
      child: Column(
        children: [
           SizedBox(height: 20),
           LastHomeSelection(),
        ],
      ),
    );
  }
}