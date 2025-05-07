import 'package:flutter/material.dart';
import 'package:oja/components/category_group_section.dart';
import 'package:oja/components/last_home_section.dart';

class ExploreScreen extends StatefulWidget {
  final String? initialCategory;
  const ExploreScreen({super.key, this.initialCategory});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
  }

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final menFashionItems = [
      const CategoryItem(label: 'Shirts', icon: Icons.checkroom),
      const CategoryItem(label: 'Jeans', icon: Icons.dry_cleaning),
      const CategoryItem(label: 'Jackets', icon: Icons.fire_extinguisher),
      const CategoryItem(label: 'Shoes', icon: Icons.hiking),
      const CategoryItem(label: 'Shirts', icon: Icons.checkroom),
      const CategoryItem(label: 'Jeans', icon: Icons.dry_cleaning),
      const CategoryItem(label: 'Jackets', icon: Icons.fire_extinguisher),
      const CategoryItem(label: 'Shoes', icon: Icons.hiking),
      const CategoryItem(label: 'Shirts', icon: Icons.checkroom),
      const CategoryItem(label: 'Jeans', icon: Icons.dry_cleaning),
      const CategoryItem(label: 'Jackets', icon: Icons.fire_extinguisher),
      const CategoryItem(label: 'Shoes', icon: Icons.hiking),
    ];

    final womenFashionItems = [
      const CategoryItem(label: 'Dresses', icon: Icons.backpack),
      const CategoryItem(label: 'Bags', icon: Icons.backpack),
      const CategoryItem(label: 'Shoes', icon: Icons.shopping_bag),
      const CategoryItem(label: 'Jewelry', icon: Icons.watch),
      const CategoryItem(label: 'Dresses', icon: Icons.backpack),
      const CategoryItem(label: 'Bags', icon: Icons.backpack),
      const CategoryItem(label: 'Shoes', icon: Icons.shopping_bag),
      const CategoryItem(label: 'Jewelry', icon: Icons.watch),
      const CategoryItem(label: 'Dresses', icon: Icons.backpack),
      const CategoryItem(label: 'Bags', icon: Icons.backpack),
      const CategoryItem(label: 'Shoes', icon: Icons.shopping_bag),
      const CategoryItem(label: 'Jewelry', icon: Icons.watch),
    ];

    return Scaffold(
      body: SafeArea(
        child: selectedCategory == null
            ? SingleChildScrollView(
          child: Column(
            children: [
              CategoryGroupSection(
                title: "Men Fashion",
                categories: menFashionItems,
                onCategoryTap: onCategorySelected,
              ),
              CategoryGroupSection(
                title: "Women Fashion",
                categories: womenFashionItems,
                onCategoryTap: onCategorySelected,
              ),
              // Add more groups if needed
            ],
          ),
        )
            : Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => setState(() => selectedCategory = null),
                  ),
                  Text(
                    selectedCategory!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: LastHomeSelection(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
