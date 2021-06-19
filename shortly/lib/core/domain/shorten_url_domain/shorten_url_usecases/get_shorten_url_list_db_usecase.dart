import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_repository/shorten_url_entity/shorten_url_entity.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_repository/shorten_url_repository.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';
import 'package:shortly/shared/base/structure/base_usecase.dart';

class GetShortenUrlListDBUsecase implements BaseUseCase<Object, Result<ErrorEntity, List<ShortenUrlEntity>>> {
  ShortenUrlRepository _repository;

  GetShortenUrlListDBUsecase(this._repository);

  @override
  Future<Result<ErrorEntity, List<ShortenUrlEntity>>> call(Object? input) async {
    var result = await _repository.getShortenUrlListDB();
    return result;
  }
}
