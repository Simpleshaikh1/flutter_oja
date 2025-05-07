import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/screens/payment_success_screen.dart';

class ChooseCardScreen extends StatefulWidget {
  const ChooseCardScreen({super.key});

  @override
  State<ChooseCardScreen> createState() => _ChooseCardScreenState();
}

class _ChooseCardScreenState extends State<ChooseCardScreen> {
  int currentPage = 0;

  final List<Map<String, String>> cards = [
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

  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Card', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.orange),
            onPressed: () {
              // Add new card logic
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: cards.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final card = cards[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      Text(card['brand']!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
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
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(cards.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentPage == index ? 12 : 8,
                height: currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.blue : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              label: 'Pay',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PaymentSuccessScreen()),
                );
                // Complete payment logic
              },
            ),
          )
        ],
      ),
    );
  }
}
