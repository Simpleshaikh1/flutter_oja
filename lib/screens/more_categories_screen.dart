import 'package:flutter/material.dart';

class MoreCategoriesScreen extends StatelessWidget {
  final Function(String category) onCategorySelected;

  const MoreCategoriesScreen({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': "Men's Fashion", 'icon': Icons.male},
      {'label': "Women's Fashion", 'icon': Icons.female},
      {'label': "Shoes", 'icon': Icons.shopping_bag},
      {'label': "Bags", 'icon': Icons.backpack},
      {'label': "Watches", 'icon': Icons.watch},
      {'label': "Electronics", 'icon': Icons.devices},
      {'label': "Beauty", 'icon': Icons.brush},
      {'label': "Furniture", 'icon': Icons.chair},
      {'label': "Gadgets", 'icon': Icons.electrical_services},
      {'label': "Phones", 'icon': Icons.phone_android},
      {'label': "Accessories", 'icon': Icons.accessibility_new},
      {'label': "Sports", 'icon': Icons.sports_basketball},
      {'label': "Books", 'icon': Icons.book},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF223263)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Color(0xFF223263),
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            thickness: 2,
            height: 0,
            // color: Colors.grey,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = categories[index];
          return ListTile(
            leading: Icon(item['icon'] as IconData, color: const Color(0xFF223263)),
            title: Text(
              item['label'] as String,
              style: const TextStyle(
                color: Color(0xFF223263),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context); // Go back
              onCategorySelected(item['label'] as String); // Trigger callback
            },
          );
        },
      ),
    );
  }
}
