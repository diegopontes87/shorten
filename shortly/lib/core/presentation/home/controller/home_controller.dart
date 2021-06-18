import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlUsecases/get_shorten_url_api_usecase.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlUsecases/save_new_shorten_url_db_usecase.dart';
import 'package:shortly/shared/base/structure/base_controller.dart';
import 'package:shortly/shared/screen_state/screen_state.dart';

class HomeController extends BaseController {
  GetShortenUrlApiUsecase _getShortenUrlUsecase;
  SaveNewShortenUrlDBUsecase _saveNewShortenUrlDBUsecase;

  HomeController(
    this._getShortenUrlUsecase,
    this._saveNewShortenUrlDBUsecase,
  );
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
    result.when(
      (errorEntity) {
        errorCallback(errorEntity.error);
        updateScreenState(ScreenState.initialState);
      }
      (shortenUrlEntity) async {
        print(shortenUrlEntity.shortLink);
        await saveNewShortenUrlIntoDB(shortenUrlEntity);
        updateScreenState(ScreenState.initialState);
      },
    );
  }

  Future saveNewShortenUrlIntoDB(ShortenUrlEntity entity) async {
    var result = await _saveNewShortenUrlDBUsecase(entity);
    result.when(
      (errorEntity) => print(errorEntity.error),
      (shortenUrlEntity) => print(shortenUrlEntity.code),
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
