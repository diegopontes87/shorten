import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/shared/res/base_res_files/app_assets.dart';
import 'package:shortly/shared/res/base_res_files/app_strings.dart';
import 'package:shortly/shared/res/styles/app_button_styles.dart';
import 'package:shortly/shared/utils/screen_state/screen_state.dart';
import 'package:shortly/shared/widgets/atoms/images/app_image_widget.dart';
import 'package:shortly/shared/widgets/atoms/text_fields/app_text_field_widget.dart';
import 'package:shortly/shared/widgets/molecules/buttons/app_big_button_widget.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';

class AppBottomActionCardWidget extends StatelessWidget {
  final Function buttonFunction;
  final TextEditingController controller;
  final ScreenState screenState;
  AppBottomActionCardWidget({
    required this.controller,
    required this.buttonFunction,
    required this.screenState,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 204.propHeight(),
        width: Get.width,
        color: Theme.of(context).colorScheme.primaryVariant,
        child: Stack(
          children: [
            AppImageWidget(
              alignment: Alignment.topRight,
              assetImagePath: AppAssets.backgroundDetail,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 49.propHeight(),
                  width: 279.propWidth(),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        4.propHeight(),
                      ),
                    ),
                  ),
                  child: AppTextFieldWidget(
                    controller: controller,
                    screenState: screenState,
                  ),
                ),
                AppBigButtonWidget(
                  margin: EdgeInsets.only(top: 10.propHeight()),
                  function: () => buttonFunction(),
                  buttonText: AppStrings.homeShortenButtonText,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  buttonStyle: AppButtonStyles.primaryButtonStyle(context),
                  screenState: screenState,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
