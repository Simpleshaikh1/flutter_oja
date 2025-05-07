import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/screens/add_card.dart';

class CreditDebitCardScreen extends StatelessWidget {
  const CreditDebitCardScreen({super.key});

  final List<Map<String, String>> cards = const [
    {
      'number': '**** **** **** 1234',
      'holder': 'John Doe',
      'expiry': '08/26',
      'brand': 'Visa',
    },
    {
      'number': '**** **** **** 5678',
      'holder': 'Jane Smith',
      'expiry': '11/25',
      'brand': 'MasterCard',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card and Debit Card', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card['brand']!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      Text(card['number']!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(card['holder']!,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 16)),
                          Text(card['expiry']!,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              label: 'Add Card',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AddCardScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
