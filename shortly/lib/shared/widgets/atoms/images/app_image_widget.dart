import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  final String assetImagePath;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  AppImageWidget({
    this.margin,
    this.alignment,
    required this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: alignment,
      child: Image.asset(
        assetImagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
