import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  final String assetImagePath;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final double? height;
  final double? width;

  AppImageWidget({
    this.margin,
    this.alignment,
    this.height,
    this.width,
    required this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      alignment: alignment,
      child: Image.asset(
        assetImagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
