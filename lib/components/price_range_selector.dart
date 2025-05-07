import 'package:flutter/material.dart';

// Price Range Widget
class PriceRangeSelector extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final RangeValues selectedRange;
  final Function(RangeValues) onChanged;

  const PriceRangeSelector({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.selectedRange,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const navyBlue = Color(0xFF223263);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '1.245',
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '9.344',
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        RangeSlider(
          values: selectedRange,
          min: minValue,
          max: maxValue,
          onChanged: onChanged,
          activeColor: navyBlue,
          inactiveColor: Colors.grey.shade300,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('MIN',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey)),
              Text('MAX',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
