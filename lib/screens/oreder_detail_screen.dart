import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart'; // for CustomButton
import 'package:oja/components/price_summary_card.dart'; // your existing component
import 'package:oja/components/cart_product_item.dart'; // your existing component
import 'package:oja/components/shipping_detail_card.dart'; // we’ll create this
import 'package:oja/components/order_progress_tracker.dart'; // we’ll create this

class OrderDetailScreen extends StatefulWidget {
  final String status;

  const OrderDetailScreen({super.key, required this.status});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                OrderProgressTracker(currentStatus: widget.status),
                const SizedBox(height: 20),
                CartProductItem(
                  image: 'assets/flash_sale_shirt2.png',
                  name: 'Cool Sneakers',
                  price: '\$120.00',
                  isFavorite: false,
                  onFavoriteToggle: () {},
                  onDelete: () {},
                  quantity: _quantity,
                  onIncrement: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (_quantity > 1) _quantity--;
                    });
                  },
                ),
                CartProductItem(
                  image: 'assets/flash_sale_shirt2.png',
                  name: 'Cool Sneakers',
                  price: '\$120.00',
                  isFavorite: false,
                  onFavoriteToggle: () {},
                  onDelete: () {},
                  quantity: _quantity,
                  onIncrement: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (_quantity > 1) _quantity--;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const ShippingDetailCard(
                  date: 'May 2, 2025',
                  shipping: 'DHL Express',
                  resi: 'DH123456789',
                  address: '123 Flutter Street, Dart City, FL',
                ),
                const SizedBox(height: 16),
                const PriceSummaryCard(
                  itemCount: 1,
                  itemTotal: 120.0,
                  shipping: 20.0,
                  importCharges: 10.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(label: 'Notify Me', onTap: () {
              Navigator.pop(context);
            }),
          )
        ],
      ),
    );
  }
}
