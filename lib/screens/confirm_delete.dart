import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';

class ConfirmDeleteScreen extends StatelessWidget {
  const ConfirmDeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Blue circle with check mark
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.error_outline_outlined,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Confirmation',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Are you sure you want to delete address.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  label: 'Delete',
                  onTap: () {
                    // Navigate to explore screen and remove all previous routes
                    Navigator.pop(
                      context,
                    );
                  },
                ),
                CustomButton(
                  label: 'Cancel',
                  onTap: () {
                    // Navigate to explore screen and remove all previous routes
                    Navigator.pop(
                      context,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
