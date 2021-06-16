import 'package:flutter/material.dart';
import 'package:shortly/shared/screen_state/screen_state.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';

class AppBigButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? function;
  final Color? textColor;
  final Color? loadingIndicatorColor;
  final ButtonStyle buttonStyle;
  final AlignmentGeometry? buttonAligment;
  final ScreenState? screenState;
  final EdgeInsetsGeometry? margin;

  AppBigButtonWidget({
    required this.function,
    required this.buttonStyle,
    required this.buttonText,
    required this.screenState,
    this.margin,
    this.buttonAligment,
    this.textColor,
    this.loadingIndicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: buttonAligment ?? Alignment.center,
      child: Container(
        width: 279.propWidth(),
        height: 49.propHeight(),
        margin: margin,
        child: ElevatedButton(
          onPressed: function,
          style: buttonStyle,
          child: screenState == ScreenState.loadingState
              ? Container(
                  height: 24.propHeight(),
                  width: 24.propWidth(),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      loadingIndicatorColor ?? Colors.white,
                    ),
                  ),
                )
              : AppTextWidget(
                  text: buttonText,
                  textAlign: TextAlign.center,
                  style: textColor == null
                      ? Theme.of(context).textTheme.headline4
                      : Theme.of(context).textTheme.headline4?.apply(
                            color: textColor,
                          ),
                ),
        ),
      ),
    );
  }
}
