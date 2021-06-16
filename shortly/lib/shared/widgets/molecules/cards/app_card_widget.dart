import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/widgets/atoms/images/app_circular_image_widget.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';

class AppCardWidget extends StatelessWidget {
  final double imageBackgroundHeight;
  final double imageBackgroundWidth;
  final Color? imageBackgroundColor;
  final Color? cardBackgroundColor;
  final double? imageBorderRadius;
  final double? cardBorderRadius;
  final String assetImagePath;
  final String cardTitle;
  final String cardSubtitle;

  AppCardWidget({
    required this.assetImagePath,
    required this.imageBackgroundHeight,
    required this.imageBackgroundWidth,
    required this.cardTitle,
    required this.cardSubtitle,
    this.cardBackgroundColor,
    this.cardBorderRadius,
    this.imageBackgroundColor,
    this.imageBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 344.propHeight(),
        width: 325.propWidth(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: cardBackgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      cardBorderRadius ?? 8.propHeight(),
                    ),
                  ),
                ),
                height: 300.propHeight(),
                width: 325.propWidth(),
                child: Column(
                  children: [
                    AppTextWidget(
                      margin: EdgeInsets.only(top: 84.propHeight()),
                      text: cardTitle,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    AppTextWidget(
                      margin: EdgeInsets.only(top: 20.propHeight()),
                      textAlign: TextAlign.center,
                      text: cardSubtitle,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            AppCircularImageWidget(
              imageBackgroundHeight: imageBackgroundHeight,
              imageBackgroundWidth: imageBackgroundWidth,
              imageBackgroundColor: imageBackgroundColor,
              imageBorderRadius: imageBorderRadius,
              assetImagePath: assetImagePath,
            ),
          ],
        ),
      ),
    );
  }
}
