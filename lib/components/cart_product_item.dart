import 'package:flutter/material.dart';

class CartProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onDelete;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onDelete,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8), // Optional spacing between items
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF223263))),
                const SizedBox(height: 20),
                Text(price, style: const TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                    onPressed: onFavoriteToggle,
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    color: Colors.grey,
                    onPressed: onDelete,
                  ),
                ],
              ),
              Row(
                children: [
                  _QuantityButton(icon: Icons.remove, onTap: onDecrement, isLeft: true,),
                  _QuantityDisplay(quantity: quantity),
                  _QuantityButton(icon: Icons.add, onTap: onIncrement, isLeft: false,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isLeft; // true if it's the left button

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade400),
            bottom: BorderSide(color: Colors.grey.shade400),
            left: isLeft ? BorderSide(color: Colors.grey.shade400) : BorderSide.none,
            right: !isLeft ? BorderSide(color: Colors.grey.shade400) : BorderSide.none,
          ),
        ),
        child: Icon(icon, size: 18, color: Colors.grey),
      ),
    );
  }
}


class _QuantityDisplay extends StatelessWidget {
  final int quantity;

  const _QuantityDisplay({required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Light grey background
        border: Border.symmetric(
          vertical: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      child: Text(
        '$quantity',
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}

