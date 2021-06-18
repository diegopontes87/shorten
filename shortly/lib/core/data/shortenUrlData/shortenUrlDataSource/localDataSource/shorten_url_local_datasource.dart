import 'dart:convert';
import 'package:multiple_result/multiple_result.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/model/shorten_url_model.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';
import 'package:shortly/shared/base/entity/error_entity.dart';
import 'package:shortly/shared/base/structure/base_db_provider.dart';
import 'package:shortly/shared/res/app_strings.dart';

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
        list.add(ShortenUrlModel.fromJson(json.decode(element.toString())).toEntity());
      });
      return Success(list);
    }
    return Error(ErrorEntity(error: AppStrings.emptyListMessage));
  }

  Future<Result<ErrorEntity, List<ShortenUrlEntity>>> deleteShortenUrlModel(String id) async {
    final db = await database;
    await db?.delete(
      AppStrings.tableName,
      where: '${AppStrings.idColumn} = ?',
      whereArgs: [id],
    );
    return await getShortenUrlList();
  }
}
