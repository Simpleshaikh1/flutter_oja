// screens/order_screen.dart
import 'package:flutter/material.dart';
import 'package:oja/components/order_card.dart';
import 'package:oja/screens/oreder_detail_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        'orderId': '#12345',
        'productName': 'Wireless Headphones',
        'dateOrdered': 'April 28, 2025',
        'status': 'Shipped',
        'itemCount': 2,
        'price': 89.99,
      },
      {
        'orderId': '#67890',
        'productName': 'Smart Watch',
        'dateOrdered': 'May 2, 2025',
        'status': 'Processing',
        'itemCount': 1,
        'price': 199.00,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderCard(
                  orderId: order['orderId'] as String,
                  productName: order['productName'] as String,
                  dateOrdered: order['dateOrdered'] as String,
                  status: order['status'] as String,
                  itemCount: order['itemCount'] as int,
                  price: order['price'] as double,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderDetailScreen(status: order['status'] as String),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
