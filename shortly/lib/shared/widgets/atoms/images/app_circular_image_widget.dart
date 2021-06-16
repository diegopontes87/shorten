import 'package:flutter/material.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';

class AppCircularImageWidget extends StatelessWidget {
  final double imageBackgroundHeight;
  final double imageBackgroundWidth;
  final Color? imageBackgroundColor;
  final double? imageBorderRadius;
  final String assetImagePath;
  AppCircularImageWidget({
    required this.assetImagePath,
    required this.imageBackgroundHeight,
    required this.imageBackgroundWidth,
    this.imageBackgroundColor,
    this.imageBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: imageBackgroundHeight,
        width: imageBackgroundWidth,
        decoration: BoxDecoration(
          color: imageBackgroundColor ?? Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.all(
            Radius.circular(imageBorderRadius ?? 44.propHeight()),
          ),
        ),
        child: Image.asset(assetImagePath),
      ),
    );
  }
}
