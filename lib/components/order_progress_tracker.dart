import 'package:flutter/material.dart';

class OrderProgressTracker extends StatelessWidget {
  final String currentStatus;
  const OrderProgressTracker({super.key, required this.currentStatus});

  final List<String> steps = const ['Packing', 'Shipping', 'Arriving', 'Success'];

  Color _getStatusColor(String step, String current) {
    final currentIndex = steps.indexOf(current);
    final stepIndex = steps.indexOf(step);
    return stepIndex <= currentIndex ? Colors.blue : Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Column(
        children: [
          Row(
            children: List.generate(steps.length * 2 - 1, (index) {
              if (index.isOdd) {
                // Line between dots
                return Expanded(
                  child: Container(
                    height: 2,
                    color: _getStatusColor(
                      steps[(index ~/ 2) + 1],
                      currentStatus,
                    ),
                  ),
                );
              } else {
                final step = steps[index ~/ 2];
                return Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _getStatusColor(step, currentStatus),
                      ),
                      child: const Icon(Icons.check, size: 14, color: Colors.white),
                    ),
                  ],
                );
              }
            }),
          ),
          const SizedBox(height: 8),
          // Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: steps
                .map((step) => SizedBox(
              width: 84,
              child: Text(
                step,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
