import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlRepository/shorten_url_repository.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';
import 'package:shortly/shared/base/structure/base_usecase.dart';
import 'package:shortly/shared/res/app_strings.dart';

class SaveNewShortenUrlDBUsecase implements BaseUseCase<ShortenUrlEntity, Result<ErrorEntity, ShortenUrlEntity>> {
  ShortenUrlRepository _repository;

  SaveNewShortenUrlDBUsecase(this._repository);

  @override
  Future<Result<ErrorEntity, ShortenUrlEntity>> call(ShortenUrlEntity? shortenUrlEntity) async {
    if (shortenUrlEntity == null)
      return Error(ErrorEntity(
        error: AppStrings.emptyValueErrorMessage,
      ));
    var result = await _repository.saveNewShortenUrlDB(shortenUrlEntity);
    return result;
  }
}
