import 'package:flutter/material.dart';
import 'package:oja/components/bottom_navbar.dart';
import 'package:oja/components/category.dart';
import 'package:oja/components/flashsale_container.dart';
import 'package:oja/components/flashsale_section.dart';
import 'package:oja/components/last_home_section.dart';
import 'package:oja/components/megasale_section.dart';
import 'package:oja/components/search_product.dart';
import 'package:oja/components/sort_option_sheet.dart';
import 'package:oja/components/store_ended_container.dart';
import 'package:oja/screens/cart_screen.dart';
import 'package:oja/screens/explore_screen.dart';
import 'package:oja/screens/favorite_screen.dart';
import 'package:oja/screens/filter_screen.dart';
import 'package:oja/screens/notification_screen.dart';
import 'package:oja/screens/offer_screen.dart';
import 'package:oja/screens/account_screen.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const ExploreScreen(),
    const CartScreen(),
    const OfferScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (_currentIndex == 0 || _currentIndex == 1)
          ? AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: GlobalSearchBar(
                  onSearch: (query) {
                    debugPrint('Search query: $query');
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (_currentIndex == 1) ...[
              // Explore tab: Show sort & filter icons
              IconButton(
                icon: const Icon(Icons.swap_vert, color: Color(0xFF223263)),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const SortOptionsSheet(),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.filter_alt_outlined, color: Color(0xFF223263)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FilterScreen()),
                  );
                },
              ),
            ] else ...[
              // Home tab: Show favorite & notification icons
              FavoriteIcon(
                isFavorite: false,
                onToggle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FavoriteScreen()),
                  );
                },
              ),
              NotificationIcon(
                notificationCount: 3,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NotificationScreen()),
                  );
                },
              ),
            ],
          ],
        ),
      )
          : null, // No AppBar for Cart, Offers, Account

      body: SafeArea(
        child: Column(
          children: [
            if (_currentIndex == 0) // Only add divider on Home tab
              const Divider(height: 20, thickness: 2),
            Expanded(child: _screens[_currentIndex]),
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
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding:   const EdgeInsets.all(16.0),
      child: Column(
        children: [

          FlashSaleContainer(discountPercentage: 40, expiryDate: DateTime(2025, 5, 15),),
          const SizedBox(height: 20),
          const CategorySection(),
          const SizedBox(height: 20),
          const FlashSaleSection(),
          const SizedBox(height: 20),
          const MegaSaleSection(),
          const SizedBox(height: 20,),
          const StoreEndedContainer(),
          const SizedBox(height: 20,),
          const LastHomeSelection(),
        ],
      ),
    );
  }
}