import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shortly/core/presentation/onboarding/controller/onboarding_controller.dart';
import 'package:shortly/core/presentation/onboarding/page/onboarding_page_list.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/res/app_assets.dart';
import 'package:shortly/shared/res/app_strings.dart';
import 'package:shortly/shared/widgets/atoms/images/app_image_widget.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';
import 'package:shortly/shared/widgets/molecules/carousel/app_carousel_indicator_widget.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) => Container(
          width: Get.width,
          height: Get.height,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImageWidget(
                alignment: Alignment.center,
                assetImagePath: AppAssets.logoImage,
                margin: EdgeInsets.only(top: 83.propHeight()),
              ),
              Container(
                height: 344.propHeight(),
                margin: EdgeInsets.only(top: 98.propHeight()),
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: controller.viewPageController,
                  onPageChanged: (value) {
                    controller.changePage(value);
                  },
                  children: OnboardingPageList.pageViewWidgetList,
                ),
              ),
              AppCarouselCounterIndicatorWidget(
                margin: EdgeInsets.only(top: 28.propHeight()),
                widgetsList: OnboardingPageList.pageViewWidgetList,
                currentWidgetIndex: controller.currentPageIndex,
                indicatorBorderColor: Theme.of(context).colorScheme.onSurface,
                indicatorBackgroundColor: Theme.of(context).colorScheme.onSurface,
                indicatorRadius: 10.propWidth(),
                indicatorBorderWidth: 2.propWidth(),
              ),
              Container(
                margin: EdgeInsets.only(top: 107.propHeight()),
                child: TextButton(
                  onPressed: () => controller.goToHomePage(),
                  child: Container(
                    width: 80.propWidth(),
                    child: AppTextWidget(
                      textAlign: TextAlign.center,
                      text: AppStrings.onboardingButtonText,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
