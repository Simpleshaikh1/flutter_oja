import 'package:flutter/material.dart';
import 'package:oja/screens/flashsale_screen.dart';

class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/flash_sale_shirt1.png',
        'price': 24.99,
        'oldPrice': 32.99,
      },
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/flash_sale_shirt2.png',
        'price': 45.00,
        'oldPrice': 60.00,
      },
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/flash_sale_shirt2.png',
        'price': 60.00,
        'oldPrice': 80.00,
      },
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/flash_sale_shirt1.png',
        'price': 60.00,
        'oldPrice': 80.00,
      },
      {
        'title': "Men's Regular Fit T-Shirt",
        'image': 'assets/flash_sale_shirt5.png',
        'price': 60.00,
        'oldPrice': 80.00,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: .0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Flash Sale',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FlashSaleScreen())
                  );
                },
                child: const Text(
                  'See More',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = products[index];
              final title = item['title'] as String;
              final image = item['image'] as String;
              final price = item['price'] as double;
              final oldPrice = item['oldPrice'] as double;
              final discount =
              (((oldPrice - price) / oldPrice) * 100).round();

              return Container(
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.asset(
                          image,
                          height: 120,
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
                            // overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '\$${price.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent),
                          ),
                          const SizedBox(height: 2),
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
                              const SizedBox(width: 8),
                              Text(
                                '$discount% Off',
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
