import 'package:flutter/material.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';

class AppCircularImageWidget extends StatelessWidget {
  final Color? imageBackgroundColor;
  final double? imageBorderRadius;
  final String assetImagePath;
  AppCircularImageWidget({
    required this.assetImagePath,
    this.imageBackgroundColor,
    this.imageBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: imageBorderRadius,
        width: imageBorderRadius,
        decoration: BoxDecoration(
          color: imageBackgroundColor ?? Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.all(
            Radius.circular(imageBorderRadius ?? 88.propHeight()),
          ),
        ),
        child: Image.asset(assetImagePath),
      ),
    );
  }
}
