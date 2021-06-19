import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shortly/shared/res/base_res_files/app_strings.dart';
import 'package:shortly/shared/utils/screen_state/screen_state.dart';
import 'package:shortly/shared/widgets/atoms/text_fields/app_text_field_widget.dart';

void main() {
  MaterialApp getMaterialApp(Widget widget) {
    return MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    );
  }

  testWidgets('Check Text Widget', (WidgetTester tester) async {
    TextEditingController textEditingController = TextEditingController();
    ScreenState screenState = ScreenState.validatingState;
    await tester.pumpWidget(getMaterialApp(
      AppTextFieldWidget(controller: textEditingController, screenState: screenState),
    ));
    final textFinder = find.text(AppStrings.homeShortenTextFieldErrorText);
    expect(textFinder, findsOneWidget);
  });
}
