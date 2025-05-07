import 'package:flutter/material.dart';

class CouponInput extends StatefulWidget {
  const CouponInput({super.key});

  @override
  State<CouponInput> createState() => _CouponInputState();
}

class _CouponInputState extends State<CouponInput> {
  final TextEditingController _controller = TextEditingController();
  String? _error;

  void _applyCoupon() {
    setState(() {
      _error = _controller.text.trim().length < 15 ? 'Your coupon is not correct' : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Coupon Code',
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: _applyCoupon,
              child: const Text('Apply', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
            ),
          ],
        ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(_error!, style: const TextStyle(color: Colors.red)),
          ),
      ],
    );
  }
}
