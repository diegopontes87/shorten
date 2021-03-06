import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_repository/shorten_url_entity/shorten_url_entity.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';

abstract class ShortenUrlRepository {
  Future<Result<ErrorEntity, ShortenUrlEntity>> getShortenUrlFromAPI(String input);
  Future<Result<ErrorEntity, ShortenUrlEntity>> saveNewShortenUrlDB(ShortenUrlEntity shortenUrlEntity);
  Future<Result<ErrorEntity, List<ShortenUrlEntity>>> getShortenUrlListDB();
  Future<Result<ErrorEntity, String>> deleteShortenUrlModelDB(String id);
}
