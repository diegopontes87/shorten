import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlDataSource/model/shorten_url_model.dart';
import 'package:shortly/core/data/shortenUrlDataSource/model/shorten_url_model_resut.dart';
import 'package:shortly/core/data/shortenUrlDataSource/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/shared/base/base_remote_datasource.dart';
import 'package:shortly/shared/res/app_request_strings.dart';

class ShortenUrlRemoteDataSource extends BaseRemoteDataSource {
  Future<Result<String, ShortenUrlEntity>> getShortenUrl(String input) async {
    try {
      Response result = await request.get(AppRequestStrings.shorten, queryParameters: {AppRequestStrings.url: input});
      var shortenUrlModelResult = ShortenUrlModelResult.fromJson(json.decode(result.toString()));
      return Success(shortenUrlModelResult.result!.toEntity());
    } on DioError catch (e) {
      print(e.message);
      return Error(e.message);
    }
  }
}
