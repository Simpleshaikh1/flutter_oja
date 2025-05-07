import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/cart_product_item.dart';
import 'package:oja/components/coupon_input.dart';
import 'package:oja/components/price_summary_card.dart';
import 'package:oja/screens/shipping_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Your Cart',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Divider(height: 2, thickness: 2),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                      quantity: 1,
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                    CartProductItem(
                      image: 'assets/flash_sale_shirt2.png',
                      name: 'Cool Sneakers',
                      price: '\$120.00',
                      isFavorite: false,
                      onFavoriteToggle: () {},
                      onDelete: () {},
                      quantity: 1,
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                    const SizedBox(height: 20),
                    const CouponInput(),
                    const PriceSummaryCard(
                      itemCount: 3,
                      itemTotal: 360.0,
                      shipping: 20.0,
                      importCharges: 10.0,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                label: 'Check Out',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ShippingScreen()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
