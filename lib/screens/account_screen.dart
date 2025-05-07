import 'package:flutter/material.dart';
import 'package:oja/screens/address_screen.dart';
import 'package:oja/screens/order_screen.dart';
import 'package:oja/screens/payment_screen.dart';
import 'package:oja/screens/profile_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'Profile', 'icon': Icons.person_outline},
      {'label': 'Order', 'icon': Icons.shopping_bag_outlined},
      {'label': 'Address', 'icon': Icons.location_on_outlined},
      {'label': 'Payment', 'icon': Icons.payment_outlined},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            minLeadingWidth: 9,
            leading: Icon(item['icon'] as IconData, color: const Color(0xFF223263), size: 30,),
            title: Text(
              item['label'] as String,
              style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            // trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              if (item['label'] == 'Profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              }
              if (item['label'] == 'Order') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderScreen()),
                );
              }
              if (item['label'] == 'Address') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddressScreen()),
                );
              }
              if (item['label'] == 'Payment') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PaymentScreen(fromCart: false,)),
                );
              }
              // TODO: Add navigation for Order, Address, Payment if needed
            },
          );
        },
      ),
    );
  }
}
