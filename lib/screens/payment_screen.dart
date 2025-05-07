import 'package:flutter/material.dart';
import 'package:oja/screens/choose_card_screen.dart';
import 'package:oja/screens/credi_debit_card_screen.dart';

class PaymentScreen extends StatelessWidget {
  final bool fromCart;

  const PaymentScreen({super.key, this.fromCart = false});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> paymentMethods = [
      {'icon': Icons.credit_card, 'label': 'Credit / Debit Card'},
      {'icon': Icons.paypal, 'label': 'PayPal'},
      {'icon': Icons.account_balance, 'label': 'Bank Transfer'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: paymentMethods.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final method = paymentMethods[index];
          return ListTile(
            onTap: () {
              if (method['label'] == 'Credit / Debit Card') {
                if (fromCart) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChooseCardScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CreditDebitCardScreen()),
                  );
                }
              }
              // Handle other methods
            },
            leading:
            Icon(method['icon'] as IconData, color: Colors.blue, size: 30),
            title: Text(
              method['label'] as String,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF223263)),
            ),
          );
        },
      ),
    );
  }
}
