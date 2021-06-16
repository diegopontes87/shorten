import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/shared/res/app_colors.dart';
import 'package:shortly/shared/widgets/atoms/carousel_indicator/app_carousel_indicator_widget.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';

class AppCarouselCounterIndicatorWidget extends StatelessWidget {
  final List<Widget> widgetsList;
  final int currentWidgetIndex;
  final EdgeInsetsGeometry? margin;
  final double indicatorRadius;
  final Color indicatorBackgroundColor;
  final Color indicatorBorderColor;
  final double? indicatorBorderWidth;

  AppCarouselCounterIndicatorWidget(
      {required this.currentWidgetIndex,
      required this.widgetsList,
      required this.indicatorBackgroundColor,
      required this.indicatorBorderColor,
      required this.indicatorRadius,
      this.indicatorBorderWidth,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.propHeight(),
      width: Get.width,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgetsList.map((widgetPage) {
          return AppCarouselIndicatorWidget(
            indicatorRadius: indicatorRadius,
            indicatorBackgroundColor: currentWidgetIndex == widgetsList.indexOf(widgetPage) ? indicatorBackgroundColor : AppColors.transparent,
            indicatorBorderColor: indicatorBorderColor,
            indicatorBorderWidth: indicatorBorderWidth,
          );
        }).toList(),
      ),
    );
  }
}
