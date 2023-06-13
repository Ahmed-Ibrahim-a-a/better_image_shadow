import 'dart:ui';

import 'package:flutter/material.dart';

class BetterImage extends StatelessWidget {
  final ImageProvider image;
  final double width;
  final double height;
  final BorderRadiusGeometry? radius;
  const BetterImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + ((7.5 / 100) * height),
      width: width,
      child: Stack(
        children: [
          Positioned(
            top: (7.5 / 100) * height,
            left: 0,
            right: 0,
            child: FractionallySizedBox(
              widthFactor: 0.85,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: ClipRRect(
                  borderRadius: radius ?? BorderRadius.circular(35),
                  child: Container(
                    width: double.infinity,
                    height: height,
                    decoration: BoxDecoration(

                        // borderRadius: BorderRadius.circular(35),
                        image: DecorationImage(
                            image: image, fit: BoxFit.cover, opacity: 0.8)),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: radius ?? BorderRadius.circular(35),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(image: image, fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}