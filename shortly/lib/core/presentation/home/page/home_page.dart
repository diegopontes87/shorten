import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/core/presentation/home/controller/home_controller.dart';
import 'package:shortly/shared/res/app_assets.dart';
import 'package:shortly/shared/res/app_strings.dart';
import 'package:shortly/shared/widgets/atoms/images/app_image_widget.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/widgets/molecules/cards/app_bottom_action_card_widget.dart';
import 'package:shortly/shared/widgets/molecules/cards/app_link_card_widget.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          height: Get.height,
          color: Theme.of(context).colorScheme.surface,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: Get.height),
            child: Stack(
              children: [
                AnimatedCrossFade(
                  duration: const Duration(seconds: 1),
                  firstChild: firstSetUrlPage(context),
                  secondChild: secondUrlListPage(context),
                  crossFadeState: controller.showFirstPage ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                ),
                AppBottomActionCardWidget(
                  controller: controller.textEditingController,
                  screenState: controller.screenState,
                  buttonFunction: () => controller.shortenLinkAction(
                    controller.textEditingController,
                    errorSnackBar,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstSetUrlPage(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
    );
  }

  Widget secondUrlListPage(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        AppTextWidget(
          width: Get.width,
          margin: EdgeInsets.only(top: 41.propHeight()),
          text: AppStrings.yourLinkHistoryTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          reverse: true,
          itemCount: controller.mediumButtonStateModelList.length,
          itemBuilder: (context, index) {
            return AppLinkCardWidget(
              mediumButtonStateModel: controller.mediumButtonStateModelList[index],
              copyFunction: () => controller.copyTextFunction(
                controller.mediumButtonStateModelList[index].entity?.shortLink,
                index,
              ),
              deleteFunction: () => controller.deleteFromDB(
                controller.mediumButtonStateModelList[index].entity?.id,
              ),
            );
          },
        ),
        Container(
          height: 200.propHeight(),
          width: Get.width,
        )
      ],
    );
  }

  void errorSnackBar(String error) {
    Get.snackbar(AppStrings.error, error);
  }
}
