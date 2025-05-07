// components/order_card.dart
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String productName;
  final String dateOrdered;
  final String status;
  final int itemCount;
  final double price;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.productName,
    required this.dateOrdered,
    required this.status,
    required this.itemCount,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderId, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 20),
              Text('$productName: $dateOrdered', style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Order Status', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Text(status),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Items', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Text('$itemCount ${itemCount == 1 ? "Item Purchased" : "Items Purchased"}', ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Price', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Text('\$${price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.w800, fontSize: 18,),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
