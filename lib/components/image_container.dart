import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> imagePaths;

  const ProductImageCarousel({super.key, required this.imagePaths});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;
  late final PageController _controller;
  static const int _initialPage= 1000;

  @override
  void initState(){
    super.initState();
    _controller = PageController(initialPage: _initialPage);
    _currentIndex = _initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemCount = widget.imagePaths.length;
    return Column(
      children: [
        // Slidable Images
        SizedBox(
          height: 300,
          width: screenWidth,
          child: PageView.builder(
            controller: _controller,
            // itemCount: widget.imagePaths.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final actualIndex = index % itemCount;
              return Image.asset(
                widget.imagePaths[actualIndex],
                fit: BoxFit.cover,
                width: screenWidth,
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Pagination Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.imagePaths.length, (index) {
            final isActive = (_currentIndex % widget.imagePaths.length) == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Colors.blue : Colors.grey.shade400,
              ),
            );
          }),
        ),
      ],
    );
  }
}
