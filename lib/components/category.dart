import 'package:flutter/material.dart';
import 'package:oja/screens/explore_screen.dart';
import 'package:oja/screens/more_categories_screen.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': 'Man Shirt', 'icon': Icons.checkroom_outlined},
      {'label': 'Dress', 'icon': Icons.shopping_bag_outlined},
      {'label': 'Work Equip.', 'icon': Icons.construction_outlined},
      {'label': 'Woman Bag', 'icon': Icons.shopping_bag_outlined},
      {'label': 'Man Shoes', 'icon': Icons.hiking_outlined},
      {'label': 'Man Pants', 'icon': Icons.work_outline},
      {'label': 'High Heels', 'icon': Icons.stairs_outlined}, // Substitute for heels
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
         Padding(
          padding:  const EdgeInsets.symmetric(horizontal: .0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
               const Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MoreCategoriesScreen(
                        onCategorySelected: (category) {
                          // Show LastHomeSelection for selected category in ExploreScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ExploreScreen(initialCategory: category),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: const Text("More Categories", style: TextStyle(
                  fontSize: 17,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),),
              ),

            ],
          ),
        ),
        const SizedBox(height: 12),
        // Horizontal Category List
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final item = categories[index];
              return Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration:  BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.white70,
                    ),
                    child: Icon(item['icon'] as IconData, color: Colors.lightBlue),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 70,
                    child: Text(
                      item['label'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
