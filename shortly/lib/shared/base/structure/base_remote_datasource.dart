import 'package:dio/dio.dart';
import 'package:shortly/shared/res/app_request_strings.dart';

class BaseRemoteDataSource {
  Dio request = Dio(
    BaseOptions(
      baseUrl: AppRequestStrings.baseUrl,
    ),
  );
}
