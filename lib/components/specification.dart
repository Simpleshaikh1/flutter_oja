import 'package:flutter/material.dart';

class SpecificationSection extends StatelessWidget {
  const SpecificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Specification',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _specRow(label: 'Style', value: 'Casual'),
          _specRow(label: 'Shown', value: 'Brown/White'),
          _specRow(label: 'Material', value: '100% Cotton'),

          const SizedBox(height: 16),
          const Text(
            'This is a stylish and comfortable shoe designed for everyday wear. '
                'It offers a breathable upper, cushioned sole, and a durable grip for all-day performance. '
                'Ideal for casual outings, walking, or light activity.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _specRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 18),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
