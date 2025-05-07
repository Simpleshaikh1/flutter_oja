import 'package:flutter/material.dart';
import 'package:oja/components/bottom_navbar.dart';
import 'package:oja/components/flashsale_container.dart';
import 'package:oja/components/last_home_section.dart';
import 'package:oja/components/search_product.dart';
import 'package:oja/screens/favorite_screen.dart';
import 'package:oja/screens/home_screen.dart';

class FlashSaleScreen extends StatefulWidget {
  const FlashSaleScreen({super.key});

  @override
  State<FlashSaleScreen> createState() => _FlashSaleScreen();
}

class _FlashSaleScreen extends State<FlashSaleScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FlashSaleScreenContent(),
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
          'Flash Sale',
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
                FavoriteIcon(isFavorite: false, onToggle: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FavoriteScreen())
                  );
                }),

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
            const Divider(height: 20, thickness: 2),
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

class FlashSaleScreenContent extends StatelessWidget{
  const FlashSaleScreenContent({super.key});

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          FlashSaleContainer(discountPercentage: 40, expiryDate: DateTime(2025, 5, 15),),
          const SizedBox(height: 20),
          const LastHomeSelection(),
        ],
      ),
    );
  }
}