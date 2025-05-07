import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class StoreEndedContainer extends StatelessWidget {
  const StoreEndedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const FadeInAssetImage(
                imagePath: 'assets/assorted_cloth.png',
              )),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "OJA Int'l Store ended Product",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "We OJA Int'l store ment the best for you.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                ),
              ),
            ],
          ),
        )
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
              if (mounted) {
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
