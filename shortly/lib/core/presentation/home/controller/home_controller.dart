import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shortly/shared/screen_state/screen_state.dart';

class HomeController extends GetxController {
  ScreenState screenState = ScreenState.initialState;
  var textEditingController = TextEditingController();

  Future shortenLinkAction(TextEditingController controller) async {
    if (controller.text.isEmpty) {
      validatingTextFieldValue();
    } else {
      updateScreenState(ScreenState.loadingState);
    }
  }

  validatingTextFieldValue() {
    updateScreenState(ScreenState.validatingState);
    Timer(Duration(seconds: 1), () {
      updateScreenState(ScreenState.initialState);
    });
  }

  updateScreenState(ScreenState newScreenState) {
    screenState = newScreenState;
    update();
  }
}
