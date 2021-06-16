import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlDataSource/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlRepository/shorten_url_repository.dart';
import 'package:shortly/shared/base/base_usecase.dart';

class GetShortenUrlUsecase implements BaseUseCase<Result<String, ShortenUrlEntity>> {
  ShortenUrlRepository _repository;

  GetShortenUrlUsecase(this._repository);

  @override
  Future<Result<String, ShortenUrlEntity>> call(String input) async {
    return await _repository.getShortenUrl(input);
  }
}
