import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/shared/res/app_assets.dart';
import 'package:shortly/shared/res/app_strings.dart';
import 'package:shortly/shared/widgets/molecules/cards/app_card_widget.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';

class OnboardingPageList {
  static List<Widget> pageViewWidgetList = [
    AppCardWidget(
      imageBackgroundHeight: 88.propHeight(),
      imageBackgroundWidth: 88.propWidth(),
      imageBackgroundColor: Theme.of(Get.context!).colorScheme.primaryVariant,
      cardBackgroundColor: Theme.of(Get.context!).colorScheme.background,
      imageBorderRadius: 44.propHeight(),
      cardBorderRadius: 8.propHeight(),
      assetImagePath: AppAssets.diagramImage,
      cardTitle: AppStrings.firstOnboardingTitle,
      cardSubtitle: AppStrings.firstOnboardingSubtitle,
    ),
    AppCardWidget(
      imageBackgroundHeight: 88.propHeight(),
      imageBackgroundWidth: 88.propWidth(),
      imageBackgroundColor: Theme.of(Get.context!).colorScheme.primaryVariant,
      cardBackgroundColor: Theme.of(Get.context!).colorScheme.background,
      imageBorderRadius: 44.propHeight(),
      cardBorderRadius: 8.propHeight(),
      assetImagePath: AppAssets.gaugeImage,
      cardTitle: AppStrings.secondOnboardingTitle,
      cardSubtitle: AppStrings.secondOnboardingSubtitle,
    ),
    AppCardWidget(
      imageBackgroundHeight: 88.propHeight(),
      imageBackgroundWidth: 88.propWidth(),
      imageBackgroundColor: Theme.of(Get.context!).colorScheme.primaryVariant,
      cardBackgroundColor: Theme.of(Get.context!).colorScheme.background,
      imageBorderRadius: 44.propHeight(),
      cardBorderRadius: 8.propHeight(),
      assetImagePath: AppAssets.toolsImage,
      cardTitle: AppStrings.thirdOnboardingTitle,
      cardSubtitle: AppStrings.thirdOnboardingSubtitle,
    ),
  ];
}