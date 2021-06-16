import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlDataSource/localDataSource/shorten_url_local_datasource.dart';
import 'package:shortly/core/data/shortenUrlDataSource/remoteDataSource/shorten_url_remote_datasource.dart';
import 'package:shortly/core/data/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlRepository/shorten_url_repository.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';

class ShortenRepositoryImpl implements ShortenUrlRepository {
  ShortenUrlRemoteDataSource _remoteDataSource;
  ShortenUrlLocalDataSource _localDataSource;

  ShortenRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Result<ErrorEntity, ShortenUrlEntity>> getShortenUrl(String input) async {
    var result = await _remoteDataSource.getShortenUrl(input);
    return result;
  }
}
