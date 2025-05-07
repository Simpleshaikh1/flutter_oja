import 'package:flutter/material.dart';

class PriceSummaryCard extends StatelessWidget {
  final int itemCount;
  final double itemTotal;
  final double shipping;
  final double importCharges;

  const PriceSummaryCard({
    super.key,
    required this.itemCount,
    required this.itemTotal,
    required this.shipping,
    required this.importCharges,
  });

  @override
  Widget build(BuildContext context) {
    double total = itemTotal + shipping + importCharges;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildRow('Items ($itemCount)', '\$${itemTotal.toStringAsFixed(2)}'),
            _buildRow('Shipping', '\$${shipping.toStringAsFixed(2)}'),
            _buildRow('Import Charges', '\$${importCharges.toStringAsFixed(2)}'),
            const Divider(),
            _buildRow('Total Price', '\$${total.toStringAsFixed(2)}', isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? Colors.black : Colors.grey)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? Colors.lightBlueAccent : Colors.blueGrey)),
        ],
      ),
    );
  }
}
