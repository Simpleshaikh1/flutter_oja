import 'package:flutter/material.dart';

class SelectSizeSection extends StatelessWidget {
  const SelectSizeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': 'X'},
      {'label': 'ML'},
      {'label': 'L'},
      {'label': 'XL'},
      {'label': 'XXL'},
      {'label': '3XL'},
      // Substitute for heels
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: .0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Size',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
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
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.white70,
                    ),
                    child: Center(
                        child: Text(
                      item['label']!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                  const SizedBox(height: 6),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
