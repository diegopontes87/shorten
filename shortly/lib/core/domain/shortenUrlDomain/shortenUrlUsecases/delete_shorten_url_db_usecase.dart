import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shorten_url_repository_impl.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlRepository/shorten_url_repository.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';
import 'package:shortly/shared/base/structure/base_usecase.dart';
import 'package:shortly/shared/res/app_strings.dart';

class DeleteShortenUrlDBUsecase implements BaseUseCase<String, Result<ErrorEntity, String>> {
  ShortenUrlRepository _repository;

  DeleteShortenUrlDBUsecase(this._repository);
  @override
  Future<Result<ErrorEntity, String>> call(String? input) async {
    if (input == null) return Error(ErrorEntity(error: AppStrings.emptyValueErrorMessage));
    var result = await _repository.deleteShortenUrlModelDB(input);
    return result;
  }
}
