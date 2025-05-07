import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  final List<Map<String, String>> feeds = const [
    {
      'title': 'New Product',
      'description': 'You can now enable dark mode in your settings.',
      'date': 'July 28, 2025 2:01pm',
      'image': 'assets/review_cloth.png'
    },
    {
      'title': 'Best Product',
      'description': 'Our service is now available in more cities.',
      'date': 'July 28, 2025 2:01pm',
      'image': 'assets/flash_sale_shirt1.png'
    },
    {
      'title': 'Best Product',
      'description': 'Our service is now available in more cities.',
      'date': 'July 28, 2025 2:01pm',
      'image': 'assets/flash_sale_shirt1.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feed',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Divider(height: 20, thickness: 2),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: feeds.length,
              itemBuilder: (context, index) {
                final feed = feeds[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          feed['image']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              feed['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF000033),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              feed['description']!,
                              style: const TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              feed['date']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
