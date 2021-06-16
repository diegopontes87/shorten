import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  final String imageAssetString;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  AppImageWidget({
    this.margin,
    this.alignment,
    required this.imageAssetString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: alignment,
      child: Image.asset(
        imageAssetString,
        fit: BoxFit.cover,
      ),
    );
  }
}
