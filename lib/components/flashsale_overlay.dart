import 'package:flutter/material.dart';
import 'dart:async';

class FlashSaleOverlay extends StatefulWidget {
  final int discountPercentage;
  final DateTime expiryDate;

  const FlashSaleOverlay({
    super.key,
    required this.discountPercentage,
    required this.expiryDate,
  });

  @override
  State<FlashSaleOverlay> createState() => _FlashSaleOverlayState();
}

class _FlashSaleOverlayState extends State<FlashSaleOverlay> {
  late Duration _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _startTimer();
  }

  void _updateRemaining() {
    final now = DateTime.now();
    final diff = widget.expiryDate.difference(now);
    setState(() {
      _remaining = diff.isNegative ? Duration.zero : diff;
    });
  }

  void _startTimer() {
    _timer =
        Timer.periodic(const Duration(seconds: 1), (_) => _updateRemaining());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _remaining.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes =
        _remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds =
        _remaining.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Flash Sale',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 4, color: Colors.black)],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${widget.discountPercentage}% Off',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 4, color: Colors.black)],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dateBox(hours),
              _separator(),
              _dateBox(minutes),
              _separator(),
              _dateBox(seconds),
            ],
          )
        ],
      ),
    );
  }

  Widget _separator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(":",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30)),
    );
  }

  Widget _dateBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
