import 'package:flutter/material.dart';

class SortOptionsSheet extends StatelessWidget {
  const SortOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final sortOptions = [
      'Best Match',
      'Time: Ending Soonest',
      'Time: Newly Listed',
      'Price + Shipping: Lowest First',
      'Price + Shipping: Highest First',
      'Distance: Nearest First',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          const Center(
            child: Text(
              'Sort By',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          ...sortOptions.map(
            (option) => ListTile(
              title: Text(option),
              onTap: () {
                // Handle sort logic
                Navigator.pop(context, option); // Return selected sort option
              },
            ),
          ),
        ],
      ),
    );
  }
}
