import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/model/shorten_url_model_result.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/model/shorten_url_model.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';
import 'package:shortly/shared/base/models/error_model.dart';
import 'package:shortly/shared/base/structure/base_remote_datasource.dart';
import 'package:shortly/shared/res/app_request_strings.dart';

class ShortenUrlRemoteDataSource extends BaseRemoteDataSource {
  Future<Result<ErrorEntity, ShortenUrlEntity>> getShortenUrl(String input) async {
    try {
      Response result = await request.get(AppRequestStrings.shorten, queryParameters: {AppRequestStrings.url: input});
      var shortenUrlModelResult = ShortenUrlModelResult.fromJson(json.decode(result.toString()));
      return Success(shortenUrlModelResult.result!.toEntity());
    } on DioError catch (e) {
      print(e.message);
      return Error(ErrorModel.fromJson(json.decode(e.response.toString())).toEntity());
    }
  }
}
