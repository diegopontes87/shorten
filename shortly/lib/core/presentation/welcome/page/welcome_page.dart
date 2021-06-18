import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/core/presentation/welcome/controller/welcome_controller.dart';
import 'package:shortly/shared/res/app_assets.dart';
import 'package:shortly/shared/res/app_strings.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/screen_state/screen_state.dart';
import 'package:shortly/shared/styles/app_button_styles.dart';
import 'package:shortly/shared/widgets/atoms/images/app_image_widget.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';
import 'package:shortly/shared/widgets/molecules/buttons/app_big_button_widget.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AppImageWidget(
              alignment: Alignment.center,
              assetImagePath: AppAssets.logoImage,
              margin: EdgeInsets.only(top: 83.propHeight()),
            ),
            AppImageWidget(
              height: 324.propHeight(),
              width: Get.width,
              alignment: Alignment.centerRight,
              assetImagePath: AppAssets.backgroundIllustration,
              margin: EdgeInsets.only(top: 20.propHeight()),
            ),
            AppTextWidget(
              width: Get.width,
              margin: EdgeInsets.only(top: 33.propHeight()),
              text: AppStrings.welcomeTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            AppTextWidget(
              width: Get.width,
              margin: EdgeInsets.only(top: 10.propHeight()),
              text: AppStrings.welcomeSubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            GetBuilder<WelcomeController>(
              init: WelcomeController(),
              builder: (controller) => AppBigButtonWidget(
                function: () => controller.goToOnboardingPage(),
                margin: EdgeInsets.only(top: 49.propHeight()),
                buttonStyle: AppButtonStyles.primaryButtonStyle(context),
                buttonText: AppStrings.welcomeButtonText,
                textColor: Theme.of(context).colorScheme.onPrimary,
                screenState: ScreenState.normalState,
              ),
            )
          ],
        ),
      ),
    );
  }
}
