import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_repository/shorten_url_entity/shorten_url_entity.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_repository/shorten_url_repository.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';
import 'package:shortly/shared/base/structure/base_usecase.dart';
import 'package:shortly/shared/res/app_strings.dart';

class GetShortenUrlApiUsecase implements BaseUseCase<String, Result<ErrorEntity, ShortenUrlEntity>> {
  ShortenUrlRepository _repository;

  GetShortenUrlApiUsecase(this._repository);

  @override
  Future<Result<ErrorEntity, ShortenUrlEntity>> call(String? input) async {
    if (input == null) return Error(ErrorEntity(error: AppStrings.emptyValueErrorMessage));
    return await _repository.getShortenUrlFromAPI(input);
  }
}
