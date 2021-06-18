import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/localDataSource/shorten_url_local_datasource.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/remoteDataSource/shorten_url_remote_datasource.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
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
  Future<Result<ErrorEntity, ShortenUrlEntity>> getShortenUrlFromAPI(String input) async {
    var result = await _remoteDataSource.getShortenUrl(input);
    return result;
  }

  @override
  Future<Result<ErrorEntity, List<ShortenUrlEntity>>> deleteShortenUrlModelDB(String id) async {
    var result = await _localDataSource.deleteShortenUrlModel(id);
    return result;
  }

  @override
  Future<Result<ErrorEntity, List<ShortenUrlEntity>>> getShortenUrlListDB() async {
    var result = await _localDataSource.getShortenUrlList();
    return result;
  }

  @override
  Future<Result<ErrorEntity, ShortenUrlEntity>> saveNewShortenUrlDB(ShortenUrlEntity shortenUrlModel) async {
    var result = await _localDataSource.saveNewShortenUrl(shortenUrlModel);
    return result;
  }
}
