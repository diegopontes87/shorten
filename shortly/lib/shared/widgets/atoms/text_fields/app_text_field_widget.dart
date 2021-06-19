import 'package:flutter/material.dart';
import 'package:shortly/shared/res/base_res_files/app_strings.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/utils/screen_state/screen_state.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    required this.controller,
    required this.screenState,
  });

  final TextEditingController controller;
  final ScreenState screenState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.propHeight(),
      width: 279.propWidth(),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(color: borderColor(context, screenState, controller.text), width: 2.propWidth()),
        borderRadius: BorderRadius.all(
          Radius.circular(
            4.propHeight(),
          ),
        ),
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          enableInteractiveSelection: true,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            hintText: hintText(context, screenState, controller.text),
            hintStyle: hintTextColor(context, screenState, controller.text),
          ),
        ),
      ),
    );
  }

  TextStyle? hintTextColor(BuildContext context, ScreenState screenState, String? text) {
    if (screenState == ScreenState.validatingState && (text == null || text.isEmpty)) {
      return Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).colorScheme.error);
    } else {
      return Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).colorScheme.secondary);
    }
  }

  String? hintText(BuildContext context, ScreenState screenState, String? text) {
    if (screenState == ScreenState.validatingState && (text == null || text.isEmpty)) {
      return AppStrings.homeShortenTextFieldErrorText;
    } else if (screenState == ScreenState.initialState) {
      return AppStrings.homeShortenTextFieldText;
    }
    return AppStrings.homeShortenTextFieldText;
  }

  Color borderColor(BuildContext context, ScreenState screenState, String? text) {
    if (screenState == ScreenState.validatingState && (text == null || text.isEmpty)) {
      return Theme.of(context).colorScheme.error;
    } else {
      return Colors.transparent;
    }
  }
}
