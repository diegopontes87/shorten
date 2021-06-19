import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_repository/shorten_url_entity/shorten_url_entity.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_usecases/delete_shorten_url_db_usecase.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_usecases/get_shorten_url_api_usecase.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_usecases/get_shorten_url_list_db_usecase.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_usecases/save_new_shorten_url_db_usecase.dart';

import 'package:shortly/shared/base/models/medium_button_state_model.dart';
import 'package:shortly/shared/base/structure/base_controller.dart';
import 'package:shortly/shared/screen_state/screen_state.dart';

class HomeController extends BaseController {
  bool showFirstPage = true;
  var textEditingController = TextEditingController();
  List<MediumButtonStateModel> mediumButtonStateModelList = [];
  GetShortenUrlApiUsecase _getShortenUrlUsecase;
  SaveNewShortenUrlDBUsecase _saveNewShortenUrlDBUsecase;
  GetShortenUrlListDBUsecase _getShortenUrlListDBUsecase;
  DeleteShortenUrlDBUsecase _deleteShortenUrlDBUsecase;

  HomeController(
    this._getShortenUrlUsecase,
    this._saveNewShortenUrlDBUsecase,
    this._getShortenUrlListDBUsecase,
    this._deleteShortenUrlDBUsecase,
  );

  Future shortenLinkAction(TextEditingController controller, Function errorCallback, Function insertAnimationFunction) async {
    if (controller.text.isEmpty) {
      validatingTextFieldValue();
    } else {
      getShortenUrlApi(
        controller.text,
        errorCallback,
        insertAnimationFunction,
      );
    }
  }

  Future getShortenUrlApi(String url, Function errorCallback, Function insertAnimationFunction) async {
    updateScreenState(ScreenState.loadingState);
    var result = await _getShortenUrlUsecase(url);
    result.when(
      (errorEntity) {
        errorCallback(errorEntity.error);
        updateScreenState(ScreenState.initialState);
      },
      (shortenUrlEntitySuccess) async {
        print(shortenUrlEntitySuccess.shortLink);
        await saveNewShortenUrlIntoDB(shortenUrlEntitySuccess);
        await getShortenUrlListFromDB(insertAnimationFunction);
        changePageVisibility();
        updateScreenState(ScreenState.doneState);
      },
    );
  }

  Future saveNewShortenUrlIntoDB(ShortenUrlEntity entity) async {
    var result = await _saveNewShortenUrlDBUsecase(entity);
    result.when(
      (errorEntity) => print(errorEntity.error),
      (succesEntity) => print(succesEntity.code),
    );
  }

  Future getShortenUrlListFromDB(Function insertAnimationFunction) async {
    var result = await _getShortenUrlListDBUsecase(null);
    result.when(
      (error) => print(error),
      (successList) {
        setMediumButtonStateList(successList, insertAnimationFunction);
      },
    );
  }

  void setMediumButtonStateList(List<ShortenUrlEntity> entityList, Function insertAnimationFunction) {
    entityList.reversed.forEach(
      (element) {
        var entity = MediumButtonStateModel(entity: element);
        if (!mediumButtonStateModelList.contains(entity)) {
          mediumButtonStateModelList.insert(0, entity);
          insertAnimationFunction();
        }
      },
    );
  }

  void changePageVisibility() {
    if (showFirstPage == true) {
      showFirstPage = !showFirstPage;
      update();
    }
  }

  void changePageVisibilityBack() {
    showFirstPage = !showFirstPage;
    update();
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

  void copyTextFunction(String? textToCopy, int entityIndex) {
    mediumButtonStateModelList.forEach((element) {
      element.isCopied = false;
    });
    mediumButtonStateModelList[entityIndex].isCopied = true;
    Clipboard.setData(new ClipboardData(text: textToCopy));
    updateScreenState(ScreenState.doneState);
  }

  Future deleteFromDB(int? id, Function deleteAnimationFunction) async {
    var result = await _deleteShortenUrlDBUsecase(id.toString());
    result.when((error) {
      print(error.error);
    }, (success) {
      deleteAnimationFunction();
    });
  }

  cleanAndCkeckList(List<MediumButtonStateModel> mediumButtonStateModelList, int index) {
    mediumButtonStateModelList.removeAt(index);
    if (mediumButtonStateModelList.isEmpty) {
      changePageVisibilityBack();
      updateScreenState(ScreenState.doneState);
    }
  }
}
