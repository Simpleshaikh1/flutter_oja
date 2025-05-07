import 'package:flutter/material.dart';
// import 'package:oja/screens/category_products_screen.dart';

class CategoryItem {
  final String label;
  final IconData icon;

  const CategoryItem({required this.label, required this.icon});
}

class CategoryGroupSection extends StatelessWidget {
  final String title;
  final List<CategoryItem> categories;
  final Function(String category) onCategoryTap;

  const CategoryGroupSection({
    super.key,
    required this.title,
    required this.categories,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
              children: categories
                  .map((item) => GestureDetector(
                onTap: () => onCategoryTap(item.label),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 0.8,
                        ),
                      ),
                      child: Icon(item.icon,
                          color: Colors.lightBlue, size: 28),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
