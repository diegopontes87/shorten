import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlUsecases/get_shorten_url_usecase.dart';
import 'package:shortly/shared/base/structure/base_controller.dart';
import 'package:shortly/shared/screen_state/screen_state.dart';

class HomeController extends BaseController {
  GetShortenUrlUsecase _getShortenUrlUsecase;

  HomeController(this._getShortenUrlUsecase);
  var textEditingController = TextEditingController();

  Future shortenLinkAction(TextEditingController controller, Function errorCallback) async {
    if (controller.text.isEmpty) {
      validatingTextFieldValue();
    } else {
      getShortenUrl(controller.text, errorCallback);
    }
  }

  Future getShortenUrl(String url, Function errorCallback) async {
    updateScreenState(ScreenState.loadingState);
    var result = await _getShortenUrlUsecase(url);
    result.when((errorEntity) {
      errorCallback(errorEntity.error);
      updateScreenState(ScreenState.initialState);
    }, (shortenUrlEntity) {
      print(shortenUrlEntity.shortLink);
      updateScreenState(ScreenState.initialState);
      },
    );
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
