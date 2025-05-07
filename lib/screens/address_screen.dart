import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/screens/add_address_screen.dart';
import 'package:oja/screens/confirm_delete.dart';
import 'package:oja/screens/edit_address.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int selectedIndex = 0;

  final List<Map<String, String>> addresses = [
    {
      'name': 'John Doe',
      'address': '123 Main Street, New York, NY',
      'phone': '+1 234 567 8901',
    },
    {
      'name': 'Jane Smith',
      'address': '456 Maple Avenue, Los Angeles, CA',
      'phone': '+1 987 654 3210',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.orange),
            onPressed: () {
              // Add new address logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...List.generate(addresses.length, (index) {
              final address = addresses[index];
              final isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? Colors.orange : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(address['address']!, style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                      ),),
                      const SizedBox(height: 20),
                      Text(address['phone']!, style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                      ),),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const EditAddressScreen()));
                              // Edit address logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            ),
                            child: const Text('Edit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,)),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const ConfirmDeleteScreen()));
                            },
                            icon: const Icon(Icons.delete_outline),
                            color: Colors.grey,
                            iconSize: 30,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
            const Spacer(),
            CustomButton(
              label: 'Add Address',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddAddressScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Example of your CustomButton widget if not defined
