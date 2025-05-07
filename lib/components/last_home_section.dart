import 'package:flutter/material.dart';
import 'package:oja/screens/product_details_screen.dart';

class LastHomeSelection extends StatelessWidget {
  const LastHomeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/last_section_cloth1.png',
        'price': 24.99,
        'oldPrice': 32.99,
        'rating': 4.5,
      },
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/last_section_cloth2.png',
        'price': 45.00,
        'oldPrice': 60.00,
        'rating': 3.8,
      },
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/last_section_cloth3.png',
        'price': 60.00,
        'oldPrice': 80.00,
        'rating': 4.2,
      },
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/last_section_cloth4.png',
        'price': 60.00,
        'oldPrice': 80.00,
        'rating': 5.0,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        SizedBox(
          height: 780, // Adjust for 2 rows
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            crossAxisSpacing: 15,
            mainAxisSpacing: 35,
            physics: const NeverScrollableScrollPhysics(), // prevent inner scrolling
            children: List.generate(products.length, (index) {
              final item = products[index];
              final title = item['title'] as String;
              final image = item['image'] as String;
              final price = item['price'] as double;
              final oldPrice = item['oldPrice'] as double;
              final rating = item['rating'] as double;
              final discount = (((oldPrice - price) / oldPrice) * 100).round();

              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProductDetailScreen(product: item)),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.asset(
                            image,
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: List.generate(5, (starIndex) {
                                final fullStar = starIndex < rating.floor();
                                final halfStar = !fullStar &&
                                    starIndex < rating &&
                                    rating % 1 >= 0.5;
                                return Icon(
                                  fullStar
                                      ? Icons.star
                                      : halfStar
                                      ? Icons.star_half
                                      : Icons.star_border,
                                  size: 14,
                                  color: Colors.amber,
                                );
                              }),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '\$${price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '\$${oldPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '$discount% Off',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
