import 'dart:convert';

import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/model/shorten_url_list_model.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/model/shorten_url_model.dart';
import 'package:shortly/shared/base/structure/base_local_datasource.dart';
import 'package:shortly/shared/res/app_strings.dart';

class ShortenUrlLocalDataSource extends BaseLocalDataSource {

  String key = AppStrings.localListKey;

  Future saveShortenUrlModel(ShortenUrlModel shortenUrlModel) async {
    ShortenUrlListModel? shortenUrlList = await getShortenUrlList();
    if(shortenUrlList != null){
      shortenUrlList.shortenUrlModelList?.add(shortenUrlModel);
      box.write(key,json.encode(shortenUrlList.toJson()));
    } else {
      shortenUrlList = ShortenUrlListModel();
      shortenUrlList.shortenUrlModelList?.add(shortenUrlModel);
      box.write(key,json.encode(shortenUrlList.toJson()));
    }
  }

  Future<ShortenUrlListModel>? getShortenUrlList() async{
    String stringList = await box.read(key);
    ShortenUrlListModel? shortenUrlList = ShortenUrlListModel.fromJson(json.decode(stringList));
    return shortenUrlList;
  }

  Future<ShortenUrlListModel?> deleteShortenUrlModel(ShortenUrlModel shortenUrlModel) async {
    ShortenUrlListModel? shortenUrlList = await getShortenUrlList();
    if(shortenUrlList != null){
      shortenUrlList.shortenUrlModelList?.removeWhere((element) => element.code == shortenUrlModel.code);
      box.remove(key);
      if(shortenUrlList.shortenUrlModelList?.length != 0) {
        box.write(key,json.encode(shortenUrlList.toJson()));
      }
      return shortenUrlList;
    }
    return shortenUrlList;
  }
}
