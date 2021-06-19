import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/shared/base/models/medium_button_state_model.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/res/base_res_files/app_strings.dart';
import 'package:shortly/shared/res/styles/app_button_styles.dart';
import 'package:shortly/shared/utils/screen_state/screen_state.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';
import 'package:shortly/shared/widgets/molecules/buttons/app_medium_buttom_widget.dart';

class AppLinkCardWidget extends StatelessWidget {
  final MediumButtonStateModel? mediumButtonStateModel;
  final VoidCallback? copyFunction;
  final VoidCallback? deleteFunction;

  AppLinkCardWidget({
    this.mediumButtonStateModel,
    this.copyFunction,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 20.propHeight()),
          height: 200.propHeight(),
          width: 325.propWidth(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.propHeight(),
            ),
          ),
          child: Card(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.propHeight()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextWidget(
                        width: 220.propWidth(),
                        text: mediumButtonStateModel?.entity?.originalLink ?? '',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Container(
                        child: IconButton(
                          onPressed: deleteFunction,
                          icon: Icon(Icons.delete),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2.propHeight(),
                ),
                AppTextWidget(
                  margin: EdgeInsets.only(left: 23.propWidth(), top: 5.propHeight()),
                  width: Get.width,
                  text: mediumButtonStateModel?.entity?.shortLink ?? '',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Spacer(),
                AppMediumButtonWidget(
                  margin: EdgeInsets.only(bottom: 23.propHeight()),
                  function: copyFunction,
                  buttonStyle: mediumButtonStateModel?.isCopied == true
                      ? AppButtonStyles.primaryVariantButtonStyle(context)
                      : AppButtonStyles.primaryButtonStyle(context),
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  buttonText: mediumButtonStateModel?.isCopied == true ? AppStrings.copiedButtonText : AppStrings.copyButtonText,
                  screenState: ScreenState.normalState,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
