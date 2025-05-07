import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/cart_product_item.dart';
import 'package:oja/components/coupon_input.dart';
import 'package:oja/components/flashsale_container.dart';
import 'package:oja/components/price_summary_card.dart';
import 'package:oja/screens/shipping_screen.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {

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
                  Text('Offer',
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
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Use "MEGSL" Coupon For Get 90% off',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    FlashSaleContainer(
                      discountPercentage: 40,
                      expiryDate: DateTime(2025, 5, 15),
                    ),
                    const SizedBox(height: 25,),
                    FlashSaleContainer(
                      discountPercentage: 40,
                      expiryDate: DateTime(2025, 5, 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
