import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_datasource/model/shorten_url_model.dart';

import 'package:shortly/core/data/shorten_url_data/shorten_url_repository/shorten_url_entity/shorten_url_entity.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';
import 'package:shortly/shared/base/structure/base_db_provider.dart';
import 'package:shortly/shared/res/base_res_files/app_strings.dart';

class ShortenUrlLocalDataSource extends BaseDBProvider {
  Future<Result<ErrorEntity, ShortenUrlEntity>> saveNewShortenUrl(ShortenUrlEntity shortenUrlEntity) async {
    final db = await database;
    var result = db?.insert(AppStrings.tableName, shortenUrlEntity.toModel().toJson());
    if (result != null) return Success(shortenUrlEntity);
    return Error(ErrorEntity(error: AppStrings.savingDBError));
  }

  Future<Result<ErrorEntity, List<ShortenUrlEntity>>> getShortenUrlList() async {
    final db = await database;
    List<Map> maps = await db!.query(
      AppStrings.tableName,
      columns: [
        AppStrings.idColumn,
        AppStrings.shortLinkColumn,
        AppStrings.originalLinkColumn,
        AppStrings.codeColumn,
      ],
    );
    if (maps.length > 0) {
      List<ShortenUrlEntity> list = [];
      maps.forEach((element) {
        list.add(ShortenUrlModel.fromJson(element).toEntity());
      });
      return Success(list);
    } else if (maps.isEmpty) {
      return Success([]);
    } else {
      return Error(ErrorEntity(error: AppStrings.emptyListMessage));
    }
  }

  Future<Result<ErrorEntity, String>> deleteShortenUrlModel(String id) async {
    final db = await database;
    var result = await db?.delete(
      AppStrings.tableName,
      where: '${AppStrings.idColumn} = ?',
      whereArgs: [id],
    );
    if (result != null) return Success(AppStrings.successDelete);
    return Error(ErrorEntity(error: AppStrings.error));
  }
}
