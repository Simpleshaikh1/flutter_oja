import 'package:flutter/material.dart';
import 'package:oja/components/flashsale_overlay.dart';
import 'package:transparent_image/transparent_image.dart';

class FlashSaleContainer extends StatelessWidget{
  final int discountPercentage;
  final DateTime expiryDate;

  const FlashSaleContainer({
    super.key,
    required this.discountPercentage,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // FadeInImage.memoryNetwork(
        //   placeholder: kTransparentImage,
        //   image: 'assets/splash_screen.png',
        //   fit: BoxFit.cover,
        //   width: double.infinity,
        //   height: 200,
        // ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const FadeInAssetImage(imagePath: 'assets/assorted_cloth.png',)
          ),
        ),


        FlashSaleOverlay(
          discountPercentage: discountPercentage,
          expiryDate: expiryDate,
        ),
      ],
    );
  }
}

class FadeInAssetImage extends StatefulWidget {
  final String imagePath;
  // final double width;
  // final double height;
  final BoxFit fit;

  const FadeInAssetImage({
    super.key,
    required this.imagePath,
    // this.width = double.infinity,
    // this.height = 200,
    this.fit = BoxFit.cover,
  });

  @override
  State<FadeInAssetImage> createState() => _FadeInAssetImageState();
}

class _FadeInAssetImageState extends State<FadeInAssetImage> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isLoaded ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 2000),
      child: Image.asset(
        widget.imagePath,
        // width: widget.width,
        // height: widget.height,
        fit: widget.fit,
        frameBuilder: (_, child, frame, __) {
          if (frame != null && !_isLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if(mounted){
                setState(() => _isLoaded = true);
              }
            });
          }
          return child;
        },
      ),
    );
  }
}
