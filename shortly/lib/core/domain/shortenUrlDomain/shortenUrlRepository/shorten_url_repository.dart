import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';

abstract class ShortenUrlRepository {
  Future<Result<ErrorEntity, ShortenUrlEntity>> getShortenUrl(String input);
}
