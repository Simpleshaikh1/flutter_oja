import 'package:flutter/material.dart';

class ShippingDetailCard extends StatelessWidget {
  final String date;
  final String shipping;
  final String resi;
  final String address;

  const ShippingDetailCard({
    super.key,
    required this.date,
    required this.shipping,
    required this.resi,
    required this.address,
  });

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
          Expanded(child: Text(value, textAlign: TextAlign.right, style: const TextStyle(color: Colors.blueGrey),)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildRow('Date Shipping', date),
          const SizedBox(height: 15,),
          _buildRow('Shipping', shipping),
          const SizedBox(height: 15,),
          _buildRow('No Resi', resi),
          const SizedBox(height: 15,),
          _buildRow('Address', address),
        ],
      ),
    );
  }
}
