import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlDataSource/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';

abstract class ShortenUrlRepository {
  Future<Result<String, ShortenUrlEntity>> getShortenUrl(String input);
}
