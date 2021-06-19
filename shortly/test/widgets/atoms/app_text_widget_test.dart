import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shortly/shared/res/base_res_files/app_strings.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';

void main() {
  MaterialApp getMaterialApp(Widget widget) {
    return MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    );
  }

  testWidgets('Check Text Widget', (WidgetTester tester) async {
    await tester.pumpWidget(getMaterialApp(
      AppTextWidget(width: Get.width, height: Get.height, text: AppStrings.appTitle),
    ));
    final textFinder = find.text(AppStrings.appTitle);
    expect(textFinder, findsOneWidget);
  });
  
}
