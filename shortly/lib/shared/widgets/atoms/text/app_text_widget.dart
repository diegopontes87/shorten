import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  AppTextWidget({
    required this.text,
    this.style,
    this.textAlign,
    this.margin,
    this.padding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      color: Colors.transparent,
      child: Text(
        text == null ? '' : text!,
        overflow: TextOverflow.ellipsis,
        style: style == null ? Theme.of(context).textTheme.headline5 : style,
        textAlign: textAlign,
      ),
    );
  }
}
