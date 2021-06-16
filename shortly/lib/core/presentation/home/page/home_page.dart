import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/core/presentation/home/controller/home_controller.dart';
import 'package:shortly/shared/res/app_assets.dart';
import 'package:shortly/shared/res/app_strings.dart';
import 'package:shortly/shared/widgets/atoms/images/app_image_widget.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/widgets/molecules/cards/app_bottom_action_card_widget.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        color: Theme.of(context).colorScheme.surface,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: Get.height),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImageWidget(
                    alignment: Alignment.center,
                    assetImagePath: AppAssets.logoImage,
                    margin: EdgeInsets.only(top: 83.propHeight()),
                  ),
                  AppImageWidget(
                    alignment: Alignment.centerRight,
                    assetImagePath: AppAssets.backgroundIllustration,
                    margin: EdgeInsets.only(top: 20.propHeight()),
                  ),
                  AppTextWidget(
                    width: Get.width,
                    margin: EdgeInsets.only(top: 33.propHeight()),
                    text: AppStrings.startTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  AppTextWidget(
                    width: Get.width,
                    margin: EdgeInsets.only(top: 10.propHeight()),
                    text: AppStrings.startSubtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              GetBuilder<HomeController>(
                builder: (_) => AppBottomActionCardWidget(
                  controller: controller.textEditingController,
                  screenState: controller.screenState,
                  buttonFunction: () => controller.shortenLinkAction(controller.textEditingController, errorSnackBar),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void errorSnackBar(String error){
    Get.snackbar(AppStrings.error, error);
  }
}
