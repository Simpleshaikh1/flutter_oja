import 'package:flutter/material.dart';
import 'package:oja/screens/activity_screen.dart';
import 'package:oja/screens/feed_screen.dart';
import 'package:oja/screens/offer_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Offer', 'icon': Icons.local_offer_outlined, 'count': 3, 'screen': const OfferScreen()},
      {'title': 'Feed', 'icon': Icons.feed_outlined, 'count': 5, 'screen': const FeedScreen()},
      {'title': 'Activity', 'icon': Icons.notifications_outlined, 'count': 2, 'screen': const ActivityScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(color: Color(0xFF000033), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Divider(height: 20, thickness: 2),
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    leading: Icon(item['icon'] as IconData, color: Colors.deepOrangeAccent),
                    title: Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: CircleAvatar(
                      radius: 15,
                      backgroundColor: const Color(0xFF000033),
                      child: Text('${item['count']}', style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    onTap: () => _navigateTo(context, item['screen'] as Widget),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
