import 'package:flutter/material.dart';
import 'package:shortly/shared/res/app_strings.dart';
import 'package:shortly/shared/screen_state/screen_state.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    required this.controller,
    required this.screenState,
  });

  final TextEditingController controller;
  final ScreenState screenState;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      enableInteractiveSelection: true,
      style: Theme.of(context).textTheme.bodyText1,
      toolbarOptions: ToolbarOptions(
        paste: true,
        cut: true,
        copy: true,
        selectAll: true,
      ),
      readOnly: false,
      focusNode: FocusNode(),
      decoration: InputDecoration(
        enabledBorder: textFieldBorderColor(context, screenState, controller.text),
        focusedBorder: textFieldBorderColor(context, screenState, controller.text),
        hintText: hintText(context, screenState, controller.text),
        hintStyle: hintTextColor(context, screenState, controller.text),
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

  InputBorder? textFieldBorderColor(BuildContext context, ScreenState screenState, String? text) {
    if (screenState == ScreenState.validatingState && (text == null || text.isEmpty)) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.propHeight())),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 1.propWidth(),
        ),
      );
    } else {
      return OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.propHeight()),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      );
    }
  }
}
