import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlUsecases/get_shorten_url_usecase.dart';
import 'package:shortly/shared/base/base_controller.dart';
import 'package:shortly/shared/screen_state/screen_state.dart';

class HomeController extends BaseController {
  GetShortenUrlUsecase _getShortenUrlUsecase;

  HomeController(this._getShortenUrlUsecase);
  var textEditingController = TextEditingController();

  Future shortenLinkAction(TextEditingController controller) async {
    if (controller.text.isEmpty) {
      validatingTextFieldValue();
    } else {
      getShortenUrl(controller.text);
    }
  }

  Future getShortenUrl(String url) async {
    updateScreenState(ScreenState.loadingState);
    var result = await _getShortenUrlUsecase(url);
    result.when((error) {
      print(error);
      updateScreenState(ScreenState.initialState);
    }, (success) {
      success;
      updateScreenState(ScreenState.initialState);
      },
    );
    updateScreenState(ScreenState.initialState);
  }

  validatingTextFieldValue() {
    updateScreenState(ScreenState.validatingState);
    Timer(
      Duration(seconds: 1),
      () {
        updateScreenState(ScreenState.initialState);
      },
    );
  }

  updateScreenState(ScreenState newScreenState) {
    screenState = newScreenState;
    update();
  }
}
