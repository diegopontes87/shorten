import 'package:flutter/material.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';

class AppCarouselIndicatorWidget extends StatelessWidget {
  final double indicatorRadius;
  final Color indicatorBackgroundColor;
  final Color indicatorBorderColor;
  final double? indicatorBorderWidth;

  AppCarouselIndicatorWidget({
    required this.indicatorBackgroundColor,
    required this.indicatorBorderColor,
    required this.indicatorRadius,
    this.indicatorBorderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: indicatorRadius,
      height: indicatorRadius,
      margin: EdgeInsets.symmetric(horizontal: 5.propWidth()),
      decoration: BoxDecoration(
        color: indicatorBackgroundColor,
        border: Border.all(
          width: indicatorBorderWidth ?? 1.propWidth(),
          color: indicatorBorderColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(indicatorRadius),
        ),
      ),
    );
  }
}
